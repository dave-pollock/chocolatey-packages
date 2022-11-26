# <img src="https://rawcdn.githack.com/dave-pollock/chocolatey-packages/22346845c9de735f305b768a0e9481e19687226a/splunk-universalforwarder/icon.png" width="48" height="48"/> [Splunk Universal Forwarder](https://chocolatey.org/packages/splunk-universalforwarder)

The universal forwarder collects data from a data source or another forwarder and sends it to a forwarder or a Splunk deployment. With a universal forwarder, you can send data to Splunk Enterprise, Splunk Light, or Splunk Cloud.

## Package Parameters
All install arguments supported by the Splunk Forwarder MSI can be provided as install arguments. For example:
```
choco install splunk-universalforwarder --install-arguments="SPLUNK_APP=SplunkForwarder FORWARD_SERVER=somehost:9997 DEPLOYMENT_SERVER=depserver:8089"
```

For a full list of available arguments, see the documentation [here](https://docs.splunk.com/Documentation/Splunk/latest/Installation/InstallonWindowsviathecommandline).