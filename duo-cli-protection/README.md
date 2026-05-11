# <img src="https://rawcdn.githack.com/dave-pollock/chocolatey-packages/22346845c9de735f305b768a0e9481e19687226a/duo-authentication/icon.png" width="48" height="48"/> [Duo Windows Command Line Protection](https://chocolatey.org/packages/duo-cli-protection)

Duo Windows Command Line Protection provides multi-factor authentication (MFA) for command-line tools like PowerShell and SSH on Windows systems.

Duo Windows Command Line Protection adds MFA protection for the following logon scenarios:

- Windows PowerShell Remoting.
- Windows OpenSSH server logons using SSH.
- Windows OpenSSH server logons using SFTP.

Please note that using this application requires an active subscription with Duo.

For more information please visit the [Duo website](https://duo.com) or view the [Duo Windows Command Line Protection Documentation](https://duo.com/docs/windows-command-line-protection).

## Package Parameters
By default this package will install the Duo Windows Command Line Protection app with no configuration. 

In order to customise your installation you may wish to pass additional parameters to the installer using `--ia`. The Duo install options are documented [here](https://help.duo.com/s/article/9467?language=en_US).

### Example
`choco install duo-cli-protection --debug --verbose --source . --ia='DUO_IKEY=DI******************** DUO_SKEY=****************************** DUO_HOST=api-*********.duosecurity.com DUO_ADDLOCAL=PowershellFeature DUO_FAILOPEN="#1"'`
