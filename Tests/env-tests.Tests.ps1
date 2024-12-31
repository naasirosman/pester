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
}
