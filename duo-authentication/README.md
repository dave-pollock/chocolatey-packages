# <img src="https://rawcdn.githack.com/dave-pollock/chocolatey-packages/22346845c9de735f305b768a0e9481e19687226a/duo-authentication/icon.png" width="48" height="48"/> [Duo Authentication](https://chocolatey.org/packages/duo-authentication)

Duo Authentication for Windows Logon add Duo two-factor authentication to Windows desktop and server logins, both at the local console and incoming Remote Desktop (RDP) connections. Starting with version 4.1.0, two-factor authentication may also be enabled for credentialed User Access Control (UAC) elevation requests, depending on your organization's Windows UAC configuration.

Please note that using this application requires an active subscription with Duo.

For more information please visit the [Duo website](https://duo.com) or view the [Duo Authentication for Windows Logon and RDP Documentation](https://duo.com/docs/rdp).

## Package Parameters
By default this package will install the Duo Authentication app with no configuration. 

In order to customise your installation you may wish to pass additional parameters to the installer. The Duo install options are documented [here](https://help.duo.com/s/article/1090?language=en_US).

*Please Note:* Any package parameters you provide are passed directly into the installer. This chocolatey package performs no validation of what you provide. If you encounter errors please ensure you are providing the correct options by reading the documentation linked above.

### Example
`choco install duo-authentication --package-parameters="'/IKEY:DIXXXXXXXXXXXXXXXXXXXX /SKEY:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /HOST:api-xxxxxxxx.duosecurity.com /AUTOPUSH:#1 /FAILOPEN:#1 /RDPONLY:#0'"`
