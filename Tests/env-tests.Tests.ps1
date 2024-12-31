BeforeAll {
    $nodeVersion = node --version
    $npmVersion = npm --version
    $azVersion = az --version | Select-Object -First 1
    $javaVersion = java --version | Select-Object -First 1
    $dockerVersion = docker --version
    $dotnetVersion = dotnet --version
    $curlVersion = curl --version | Select-Object -First 1
    $gitVersion = git --version
    $pwshVersion = $PSVersionTable.PSVersion.ToString()
}

Describe "Development Environment Validation" {
    Context "Node.js Environment" {
        It "Node should be installed" {
            $nodeVersion | Should -Not -BeNullOrEmpty
        }

        It "Node should be a valid version" {
            $nodeVersion | Should -Match "v\d{1,2}\.\d{1,2}\.\d{1,2}"
        }

        It "Node should be a specific version" {
            $nodeVersion | Should -BeExactly "v18.19.1"
        }

        It "npm should be installed" {
            $npmVersion | Should -Not -BeNullOrEmpty 
        }

        It "npm should be a valid version" {
            $npmVersion | Should -Match "\d{1,2}\.\d{1,2}\.\d{1,2}"
        }

        It "npm should be a specific version" {
            $npmVersion | Should -BeExactly "9.2.0"
        }
    }

    Context "Azure CLI" {
        It "Azure CLI should be installed" {
            $azVersion | Should -Not -BeNullOrEmpty
        }

        It "Azure CLI should be a valid version" {
            $azVersion | Should -Match "azure-cli \d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }

    Context "Java Environment" {
        It "Java should be installed" {
            $javaVersion | Should -Not -BeNullOrEmpty
        }

        It "Java should be a valid version" {
            $javaVersion | Should -Match "java \d{1,2}(\.\d{1,2}\.\d{1,2})?"
        }
    }

    Context "Docker Environment" {
        It "Docker should be installed" {
            $dockerVersion | Should -Not -BeNullOrEmpty
        }

        It "Docker should be a valid version" {
            $dockerVersion | Should -Match "Docker version \d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }

    Context ".NET Environment" {
        It "dotnet should be installed" {
            $dotnetVersion | Should -Not -BeNullOrEmpty
        }

        It "dotnet should be a valid version" {
            $dotnetVersion | Should -Match "\d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }

    Context "Curl Tool" {
        It "curl should be installed" {
            $curlVersion | Should -Not -BeNullOrEmpty
        }

        It "curl should be a valid version" {
            $curlVersion | Should -Match "curl \d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }

    Context "Git" {
        It "git should be installed" {
            $gitVersion | Should -Not -BeNullOrEmpty
        }

        It "git should be a valid version" {
            $gitVersion | Should -Match "git version \d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }

    Context "PowerShell" {
        It "PowerShell should be installed" {
            $pwshVersion | Should -Not -BeNullOrEmpty
        }

        It "PowerShell should be a valid version" {
            $pwshVersion | Should -Match "\d{1,2}\.\d{1,2}\.\d{1,2}"
        }
    }
}
