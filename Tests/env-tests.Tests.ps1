Describe "Development Environment Validation" {

    Context "Node.js Environment" {
        It "Node should be installed" {
            $nodeVersion = node --version
            $nodeVersion | Should -Not -BeNullOrEmpty -Because "Node.js is not installed or not in PATH."
        }
        It "Node should be a valid version" {
            $nodeVersion = node --version
            $nodeVersion | Should -Match "v\d+\.\d+\.\d+" -Because "Node.js version format is invalid."
        }
        It "Node should be a specific version" {
            $nodeVersion = node --version
            $nodeVersion | Should -BeExactly "v20.18.1"  # Matches the actual version
        }
    }

    Context "npm Environment" {
        It "npm should be installed" {
            $npmVersion = npm --version
            $npmVersion | Should -Not -BeNullOrEmpty -Because "npm is not installed or not in PATH."
        }
        It "npm should be a valid version" {
            $npmVersion = npm --version
            $npmVersion | Should -Match "\d+\.\d+\.\d+" -Because "npm version format is invalid."
        }
        It "npm should be a specific version" {
            $npmVersion = npm --version
            $npmVersion | Should -BeExactly "10.8.2"  # Matches the actual version
        }
    }

    Context "Azure CLI" {
        It "Azure CLI should be installed" {
            $azVersion = az --version | Out-String
            $azVersion | Should -Not -BeNullOrEmpty -Because "Azure CLI is not installed or not in PATH."
        }
        It "Azure CLI should be a valid version" {
            $azVersion = az --version | Out-String
            # Match the primary Azure CLI version
            $azVersion | Should -Match "azure-cli\s+\d+\.\d+\.\d+" -Because "Azure CLI version format is invalid."
        }
        It "Azure CLI should be a specific version" {
            $azVersion = az --version | Out-String
            # Match the specific version
            $azVersion | Should -Match "azure-cli\s+2\.67\.0" -Because "Azure CLI version does not match the expected value."
        }
    }
    

    Context "Java Environment" {
        It "Java should be installed" {
            $javaVersion = java --version | Out-String
            $javaVersion | Should -Not -BeNullOrEmpty -Because "Java is not installed or not in PATH."
        }
        It "Java should be a valid version" {
            $javaVersion = java --version | Out-String
            $javaVersion | Should -Match "openjdk \d+\.\d+\.\d+" -Because "Java version format is invalid."
        }
        It "Java should be a specific version" {
            $javaVersion = java --version | Out-String
            $javaVersion | Should -Match "openjdk 17.0.13"  # Matches the actual version
        }
    }

    Context "Docker Environment" {
        It "Docker should be installed" {
            $dockerVersion = docker --version
            $dockerVersion | Should -Not -BeNullOrEmpty -Because "Docker is not installed or not in PATH."
        }
        It "Docker should be a valid version" {
            $dockerVersion = docker --version
            $dockerVersion | Should -Match "Docker version \d+\.\d+\.\d+" -Because "Docker version format is invalid."
        }
        It "Docker should be a specific version" {
            $dockerVersion = docker --version
            $dockerVersion | Should -Match "Docker version 26.1.3"  # Matches the actual version
        }
    }

    Context "PowerShell Environment" {
        It "PowerShell should be installed" {
            $pwshVersion = $PSVersionTable.PSVersion.ToString()
            $pwshVersion | Should -Not -BeNullOrEmpty -Because "PowerShell version could not be determined."
        }
        It "PowerShell should be a valid version" {
            $pwshVersion = $PSVersionTable.PSVersion.ToString()
            $pwshVersion | Should -Match "^\d+\.\d+\.\d+" -Because "PowerShell version format is invalid."
        }
        It "PowerShell should be a specific version" {
            $pwshVersion = $PSVersionTable.PSVersion.ToString()
            $pwshVersion | Should -Match "^7\." -Because "PowerShell version should be 7.x (PowerShell Core)."
        }
    }

    Context "Pester Environment" {
        It "Pester should be installed" {
            $pesterVersion = (Get-Module -Name Pester -ListAvailable).Version.ToString()
            $pesterVersion | Should -Not -BeNullOrEmpty -Because "Pester is not installed."
        }
        It "Pester should be a valid version" {
            $pesterVersion = (Get-Module -Name Pester -ListAvailable).Version.ToString()
            $pesterVersion | Should -Match "^\d+\.\d+\.\d+" -Because "Pester version format is invalid."
        }
    }

    Context ".NET Environment" {
        It "dotnet should be installed" {
            $dotnetVersion = dotnet --version
            $dotnetVersion | Should -Not -BeNullOrEmpty -Because ".NET SDK is not installed or not in PATH."
        }
        It "dotnet should be a valid version" {
            $dotnetVersion = dotnet --version
            $dotnetVersion | Should -Match "^\d+\.\d+\.\d+" -Because ".NET SDK version format is invalid."
        }
        It "dotnet should be a specific version" {
            $dotnetVersion = dotnet --version
            $dotnetVersion | Should -Match "^7\.|^6\." -Because ".NET SDK version should be 6.x or 7.x"
        }
    }

    Context "curl Environment" {
        It "curl should be installed" {
            $curlVersion = curl --version | Select-Object -First 1
            $curlVersion | Should -Not -BeNullOrEmpty -Because "curl is not installed or not in PATH."
        }
        It "curl should be a valid version" {
            $curlVersion = curl --version | Select-Object -First 1
            $curlVersion | Should -Match "curl \d+\.\d+\.\d+" -Because "curl version format is invalid."
        }
    }

    Context "Git Environment" {
        It "git should be installed" {
            $gitVersion = git --version
            $gitVersion | Should -Not -BeNullOrEmpty -Because "Git is not installed or not in PATH."
        }
        It "git should be a valid version" {
            $gitVersion = git --version
            $gitVersion | Should -Match "git version \d+\.\d+\.\d+" -Because "Git version format is invalid."
        }
    }

    Context "Ansible Environment" {
        It "ansible should be installed" {
            $ansibleVersion = ansible --version | Select-Object -First 1
            $ansibleVersion | Should -Not -BeNullOrEmpty -Because "Ansible is not installed or not in PATH."
        }
        It "ansible should be a valid version" {
            $ansibleVersion = ansible --version | Select-Object -First 1
            $ansibleVersion | Should -Match "ansible \[core \d+\.\d+\.\d+\]" -Because "Ansible version format is invalid."
        }
    }

    Context "jq Environment" {
        It "jq should be installed" {
            $jqVersion = jq --version
            $jqVersion | Should -Not -BeNullOrEmpty -Because "jq is not installed or not in PATH."
        }
        It "jq should be a valid version" {
            $jqVersion = jq --version
            $jqVersion | Should -Match "jq-\d+\.\d+" -Because "jq version format is invalid."
        }
    }

    Context "Python Environment" {
        It "python should be installed" {
            $pythonVersion = python3 --version
            $pythonVersion | Should -Not -BeNullOrEmpty -Because "Python is not installed or not in PATH."
        }
        It "python should be a valid version" {
            $pythonVersion = python3 --version
            $pythonVersion | Should -Match "Python \d+\.\d+\.\d+" -Because "Python version format is invalid."
        }
        It "python should be version 3.x" {
            $pythonVersion = python3 --version
            $pythonVersion | Should -Match "Python 3\." -Because "Python version should be 3.x"
        }
    }
}
