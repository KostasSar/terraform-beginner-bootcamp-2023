# Terraform Beginner Bootcamp 2023

## AWS

### Credentials and environment variables

For quick and secure access to the AWS environment, the credentials and cli preferences can be set as evironment variables.

After appending the following to the `~/.bash_profile` file using your favorite text editor.

```bash
export AWS_ACCESS_KEY_ID={KEY_ID_VALUE}
export AWS_SECRET_ACCESS_KEY={SECRET_KEY_VALUE}
export AWS_DEFAULT_REGION=eu-east-3
export AWS_CLI_AUTO_PROMPT=on-partial
```

Then to apply the changes without reopening the terminal, execute

```bash
source ~/.bash_profile
```


## Terraform cloud

### Login Issue Fix

When trying to login to Terraform Cloud I discovered that all the login issues we faced with GitPod in the videos can be solved by pressing `CTRL+c`.
This was stopping the prompts and menus generated and just pointed to a prompt asking for the token.
After pasing, I go the **Successful login** message!
No need for workarounds or the additional bash script.

## Sources

* [AWS Environment Variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)