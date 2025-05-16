##printer install##

# Define variables
$PrinterIP = "192.168.8.7"                 #put the printers IP
$PrinterName = "HPyadayada"         #local name of the machine
$PrinterShare = "\\FS2\x\x" #path to server share
$PortName = "IP_$PrinterIP"   #port name

# check printer exists
if (-not (Get-PrinterPort -Name $PortName -ErrorAction SilentlyContinue)) {
    Write-Output "Creating Port: $PortName"
    Add-PrinterPort -Name $PortName -PrinterHostAddress $PrinterIP
} else {
    Write-Output "Printer port $PortName already exists."
}

# Check if the printer already exists
if (-not (Get-Printer -Name $PrinterName -ErrorAction SilentlyContinue)) {
    Write-Output "Installing printer: $PrinterName"
    Add-Printer -Name $PrinterName -PortName $PortName -ConnectionName $PrinterShare
} else {
    Write-Output "Printer $PrinterName already exists."
}
