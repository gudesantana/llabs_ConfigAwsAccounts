resource "aws_cloudwatch_event_rule" "console" {
  name        = "rule-event-alert-root-login-${var.account_name}"
  description = "Capture each AWS Console Sign In"

  event_pattern = <<EOF
{
  "detail-type": ["AWS Console Sign In via CloudTrail"],
  "detail": {
    "userIdentity": {
      "type": ["Root"]
    }
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.aws_logins.arn
}

# resource "aws_sns_topic" "aws_logins" {
#   name = "sns-topic-alert-root-login-${var.account_name}"
# }

locals {
  # emails = ["hello@world.com"]
  emails = [var.sns_email]
}

resource "aws_sns_topic" "aws_logins" {
  name            = "sns-topic-alert-root-login-${var.account_name}"
  delivery_policy = jsonencode({
    "http" : {
      "defaultHealthyRetryPolicy" : {
        "minDelayTarget" : 20,
        "maxDelayTarget" : 20,
        "numRetries" : 3,
        "numMaxDelayRetries" : 0,
        "numNoDelayRetries" : 0,
        "numMinDelayRetries" : 0,
        "backoffFunction" : "linear"
      },
      "disableSubscriptionOverrides" : false,
      "defaultThrottlePolicy" : {
        "maxReceivesPerSecond" : 1
      }
    }
  })
}

resource "aws_sns_topic_subscription" "topic_email_subscription" {
  count     = length(local.emails)
  topic_arn = aws_sns_topic.aws_logins.arn
  protocol  = "email"
  endpoint  = local.emails[count.index]
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.aws_logins.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.aws_logins.arn]
  }
}