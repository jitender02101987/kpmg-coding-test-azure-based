S2
-------------
This solution is for fetching meta-data of virtual machine's key passed

### Prerequisite
-   Install [Azure Cli]
-   Create Service Principal with contributer access on your subscription scope
-   Create virtual machine in resourceGroup

Usage:
--------

getMetaDataKeyComputeEngine.sh requires 2 mandatory parameters and one optional parameter. This optional parameter will used when you want to fetch the value for particular key from virtual machine's metdata

    virtualmachinename  - Name of the instance for which metadata is required for
    resourcegroup   - name of the project where the instance exists
    virtualmachinekey (optional) - the metadata key for which the value need to be fetched
    
Result:
--------
    
1. Passing 2 mandatory parameters
    :~#./getMetaDataKeyVirtualMachine.sh kpmgquestion1-dev-appvm-tf kpmgquestion1-dev-rg-tf  
      
    Metadata of virtual machine kpmgquestion1-dev-appvm-tf as key is not passed:{
  "additionalCapabilities": null,
  "applicationProfile": null,
  "availabilitySet": null,
  "billingProfile": null,
  "capacityReservation": null,
  "diagnosticsProfile": {
    "bootDiagnostics": {
      "enabled": false,
      "storageUri": null
    }
  },
  "evictionPolicy": null,
  "extendedLocation": null,
  "extensionsTimeBudget": "PT1H30M",
  "hardwareProfile": {
    "vmSize": "Standard_F2",
    "vmSizeProperties": null
  },
  "host": null,
  "hostGroup": null,
  "id": "/subscriptions/5c265d3c-ff46-4102-8c22-6ea6615689ad/resourceGroups/kpmgquestion1-dev-rg-tf/providers/Microsoft.Compute/virtualMachines/kpmgquestion1-dev-appvm-tf",
  "identity": null,
  "instanceView": null,
  "licenseType": null,
  "location": "eastus",
  "name": "kpmgquestion1-dev-appvm-tf",
  "networkProfile": {
    "networkApiVersion": null,
    "networkInterfaceConfigurations": null,
    "networkInterfaces": [
      {
        "deleteOption": null,
        "id": "/subscriptions/5c265d3c-ff46-4102-8c22-6ea6615689ad/resourceGroups/kpmgquestion1-dev-rg-tf/providers/Microsoft.Network/networkInterfaces/kpmgquestion1-dev-appvm-tf-nic",
        "primary": true,
        "resourceGroup": "kpmgquestion1-dev-rg-tf"
      }
    ]
  },
  "osProfile": {
    "adminPassword": null,
    "adminUsername": "kpmguser",
    "allowExtensionOperations": true,
    "computerName": "kpmgquestion1-dev-appvm-tf",
    "customData": null,
    "linuxConfiguration": {
      "disablePasswordAuthentication": true,
      "enableVmAgentPlatformUpdates": false,
      "patchSettings": {
        "assessmentMode": "ImageDefault",
        "automaticByPlatformSettings": null,
        "patchMode": "ImageDefault"
      },
      "provisionVmAgent": true,
      "ssh": {
        "publicKeys": [
          {
            "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAH86pAk0H+ZI71VoYoMwQ1PYJzeCho8UyJWoVilmhYZgOYRKWIH1WQusPIsqXd82/UBJ2+hQabh1FWgM0mbLjQVRM+PhQ8SwaVDOMlIAyQgARt7vUD4+VjMAm4MXn5lbOStxTbxLi39XIQIvncu/qnNqGGQgZA2Y5VWtztUsx4F0nEUIjrA4lZFAqsHJetrxfL1F0hqi6fhD+l24y++wgC89W0Oox6LC22BB1Q4XWAdTDhqllR1HObnmIEULi4DkjT5ntrfws3of9k2tKJI7eQ8RTqOol84uzKImDCS3CraHGiKdpv49IyRlGUg5jhvmwFNnLMvRmA6C8OGXvmcnwPoaGfobvGjccpAABcdyK62nH78lQObtjtr24Wgoz2FGxLiiFstOFPamkDhWcZfflmZSwGmIidE7M/OvOrePovn2EsPLSV1Te0VG/aQxLY78/MtvWvXOsAufAH0tf11hfMcjQjXTu9Qf7X7pc5TrJLMmvM/fug/CBqFPk07Rd/uM= ravi_prakash@Ravi\r\n",
            "path": "/home/kpmguser/.ssh/authorized_keys"
          }
        ]
      }
    },
    "requireGuestProvisionSignal": true,
    "secrets": [],
    "windowsConfiguration": null
  },
  "plan": null,
  "platformFaultDomain": null,
  "priority": "Regular",
  "provisioningState": "Succeeded",
  "proximityPlacementGroup": null,
  "resourceGroup": "kpmgquestion1-dev-rg-tf",
  "resources": null,
  "scheduledEventsProfile": null,
  "securityProfile": null,
  "storageProfile": {
    "dataDisks": [],
    "diskControllerType": null,
    "imageReference": {
      "communityGalleryImageId": null,
      "exactVersion": "16.04.202109280",
      "id": null,
      "offer": "UbuntuServer",
      "publisher": "Canonical",
      "sharedGalleryImageId": null,
      "sku": "16.04-LTS",
      "version": "latest"
    },
    "osDisk": {
      "caching": "ReadWrite",
      "createOption": "FromImage",
      "deleteOption": "Detach",
      "diffDiskSettings": null,
      "diskSizeGb": 30,
      "encryptionSettings": null,
      "image": null,
      "managedDisk": {
        "diskEncryptionSet": null,
        "id": "/subscriptions/5c265d3c-ff46-4102-8c22-6ea6615689ad/resourceGroups/kpmgquestion1-dev-rg-tf/providers/Microsoft.Compute/disks/kpmgquestion1-dev-appvm-tf_OsDisk_1_3249c72f9fa2471e84274d34daaa5703",
        "resourceGroup": "kpmgquestion1-dev-rg-tf",
        "securityProfile": null,
        "storageAccountType": "Standard_LRS"
      },
      "name": "kpmgquestion1-dev-appvm-tf_OsDisk_1_3249c72f9fa2471e84274d34daaa5703",
      "osType": "Linux",
      "vhd": null,
      "writeAcceleratorEnabled": false
    }
  },
  "tags": {},
  "timeCreated": "2023-04-01T16:16:37.083926+00:00",
  "type": "Microsoft.Compute/virtualMachines",
  "userData": null,
  "virtualMachineScaleSet": null,
  "vmId": "32488dde-ab7e-4a35-a9d2-53b8f80ad361",
  "zones": null
}


    
2. Passing 2 mandatory and optional parameter i.e. virtualmachinekey
      
      
    :~#./getMetaDataKeyVirtualMachine.sh kpmgquestion1-dev-appvm-tf kpmgquestion1-dev-rg-tf storageProfile.osDisk
      
      Key's storageProfile.osDisk output for virtual-machine kpmgquestion1-dev-appvm-tf :{
		"caching": "ReadWrite",
		"createOption": "FromImage",
		"deleteOption": "Detach",
		"diffDiskSettings": null,
		"diskSizeGb": 30,
		"encryptionSettings": null,
		"image": null,
		"managedDisk": {
			"diskEncryptionSet": null,
			"id": "/subscriptions/5c265d3c-ff46-4102-8c22-6ea6615689ad/resourceGroups/kpmgquestion1-dev-rg-tf/providers/Microsoft.Compute/disks/kpmgquestion1-dev-appvm-tf_OsDisk_1_3249c72f9fa2471e84274d34daaa5703",
			"resourceGroup": "kpmgquestion1-dev-rg-tf",
			"securityProfile": null,
			"storageAccountType": "Standard_LRS"
		},
		"name": "kpmgquestion1-dev-appvm-tf_OsDisk_1_3249c72f9fa2471e84274d34daaa5703",
		"osType": "Linux",
		"vhd": null,
		"writeAcceleratorEnabled": false
	}
    
3. Passing 2 mandatory parameters (Failure scenario)
      
      
    $ ./getMetaDataKeyVirtualMachine.sh kpmgquestion1-dev-appvm-tf kpmgquestion1-dev-rg
		ERROR: (ResourceGroupNotFound) Resource group 'kpmgquestion1-dev-rg' could not be found.
		Code: ResourceGroupNotFound
		Message: Resource group 'kpmgquestion1-dev-rg' could not be found.
		Vitrual machines does not exists. Please pass correct details.
      
4. Passing incorrect incorrect key (Failure scenraio)
      
     $ ./getMetaDataKeyVirtualMachine.sh kpmgquestion1-dev-appvm-tf kpmgquestion1-dev-rg-tf storageProfile.osDi
	Key is not present in metadata.
 
      