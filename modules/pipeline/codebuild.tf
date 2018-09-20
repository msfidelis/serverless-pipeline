data "template_file" "buildspec" {
  template = "${file("${path.module}/templates/buildspec.yml")}"

  vars {
    app_name   = "${var.app_name}"
  }
}

resource "aws_codebuild_project" "app_build" {
  name          = "${var.app_name}-codebuild"
  build_timeout = "60"

  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"

    // https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html
    image           = "aws/codebuild/docker:17.09.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "${data.template_file.buildspec.rendered}"
  }
}
