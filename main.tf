data "aws_sns_topic" "topic" {
  name = var.sns-topic
}

data "aws_sqs_queue" "queue" {
  name = var.queue
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  count = var.enabled ? 1 : 0
  alarm_name = "${data.aws_sqs_queue.queue.name} sqs"
  alarm_description = "New message in queue ${var.queue}."
  namespace = "AWS/SQS"
  metric_name = "NumberOfMessagesSent"
  dimensions = {
    QueueName = data.aws_sqs_queue.queue.name
  }
  statistic = "Sum"
  period = var.period
  comparison_operator = "GreaterThanThreshold"
  threshold = 0
  evaluation_periods = var.evaluation_period
  treat_missing_data = "notBreaching"

  alarm_actions = [ data.aws_sns_topic.topic.arn ]

  tags = var.tags
}
