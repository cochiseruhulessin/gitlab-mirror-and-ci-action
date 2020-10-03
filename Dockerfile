FROM python:3.8-alpine

LABEL "com.github.actions.name"="Mirror to GitLab and run GitLab CI"
LABEL "com.github.actions.description"="Automate mirroring of git commits to GitLab, trigger GitLab CI and post results back to GitHub"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/SvanBoxel/gitlab-mirror-and-ci-action"
LABEL "homepage"="https://github.com/SvanBoxel/gitlab-mirror-and-ci-action"
LABEL "maintainer"="Sebass van Boxel <hello@svboxel.com>"

RUN apk update && apk add --no-cache curl git
RUN python -m pip install requests
COPY entrypoint.sh /entrypoint.sh
COPY cred-helper.sh /cred-helper.sh
COPY trigger-pipeline /trigger-pipeline
RUN chmod +x /trigger-pipeline
ENTRYPOINT ["/entrypoint.sh"]
