#!/bin/bash
#set -x

function usage()
{
   echo o "Usage: $0 "virtual-machine" "resource-group" or "virtual-machine" "resource-group" "virtualmachinekey" should be passed"
   exit 1
}

if [ $# -lt 2  ] ; then
    usage;
    exit 0;
fi;

#function to get the metadata or key of azure virtual machine

function getMetaDataKeyVirtualMachine()
{
    az login --service-principal -u ab71d883-6e83-44b3-a3e6-03b014c423d0 -p 5b68Q~Y-xnWzZOvfy1ckErbKLF2UrGTxjcoo8aYS --tenant 3eed6cf0-578f-4fdc-8c56-b41a9db82a11 > /dev/null
    if [ -z "${virtualmachinekey}" ]
    then
      value=$(az vm show --resource-group $resourcegroup --name $virtualmachinename --output json)
      if [ -z "${value}" ]
      then
        printf "Vitrual machines does not exists. Please pass correct details.\n"
      else
        echo "Metadata of virtual machine ${virtualmachinename} as key is not passed:" "${value}"
      fi
    else
      value=$(az vm show --resource-group $resourcegroup --name $virtualmachinename --query $virtualmachinekey --output json)
	  if [ -z "${value}" ]
      then 
        printf "Key is not present in metadata.\n"
      else 
        printf "Key's ${virtualmachinekey} output for virtual-machine %s :%s" "${virtualmachinename}" "${value}"
      fi
    fi
}

virtualmachinename=$1
resourcegroup=$2
virtualmachinekey=$3

getMetaDataKeyVirtualMachine