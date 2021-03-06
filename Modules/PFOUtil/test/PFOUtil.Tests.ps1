$ModuleManifestName = 'PFOUtil.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

Describe 'Format-SwarmName Parameters' -Tag 'Format-SwarmName' {

   It 'Tests for mandatory string Name parameter' {

        Get-Command Format-SwarmName | Should -HaveParameter 'Name' -Type String -Mandatory

   }

}

Describe 'Format-SwarmNameContractor Parameters' -Tag 'Format-SwarmNameContractor' {

    It 'Tests for mandatory string Name parameter' {
 
         Get-Command Format-SwarmNameContractor | Should -HaveParameter 'Name' -Type String -Mandatory
 
    }
 
 }

Describe 'Tests output of Format-SwarmName' -Tag 'Format-SwarmName' {

    it 'Tests given name' {

        $Objects = Format-SwarmName -Name 'anomander rake' | Test-FormatName

        $Objects.GivenName     | Should -BeExactly 'Anomander'
        $Objects.Surname       | Should -BeExactly 'Rake'
        $Objects.FirstName     | Should -BeExactly 'Anomander'
        $Objects.LastName      | Should -BeExactly 'Rake'
        $Objects.DisplayName   | Should -BeExactly 'Anomander Rake'
        $Objects.UserName      | Should -BeExactly 'rakea'
        $Objects.EmailAddress  | Should -BeExactly 'Anomander.Rake@swarm.com'
        $Objects.PrimarySMTP   | Should -BeExactly 'Anomander.Rake@swarm.com'
        $Objects.ProxyAddress1 | Should -BeExactly 'rakea@swarm.com'
        $Objects.ProxyAddress2 | Should -BeExactly 'rakea@swarm.co.nz'
        $Objects.ProxyAddress3 | Should -BeExactly 'Anomander.Rake@swarm.co.nz'

    }

}

Describe 'Tests output of Format-SwarmContractor Name function' -Tag 'Format-SwarmNameContractor' {

    it 'Tests given name' {

        $Objects = Format-SwarmNameContractor -Name 'anomander rake' | Test-FormatNameContractor

        $Objects.GivenName     | Should -BeExactly 'Anomander'
        $Objects.Surname       | Should -BeExactly 'Rake'
        $Objects.FirstName     | Should -BeExactly 'Anomander'
        $Objects.LastName      | Should -BeExactly 'Rake'
        $Objects.DisplayName   | Should -BeExactly 'Anomander Rake'
        $Objects.UserName      | Should -BeExactly 'rake_a'
        $Objects.EmailAddress  | Should -BeExactly 'Anomander.Rake@swarm.com'
        $Objects.PrimarySMTP   | Should -BeExactly 'Anomander.Rake@swarm.com'
        $Objects.ProxyAddress1 | Should -BeExactly 'rake_a@swarm.com'
        $Objects.ProxyAddress2 | Should -BeExactly 'rake_a@swarm.co.nz'
        $Objects.ProxyAddress3 | Should -BeExactly 'Anomander.Rake@swarm.co.nz'

    }

}

Describe 'Tests output of Format-SwarmNameApostrophe Name function' -Tag 'Format-SwarmNameApostrophe' {

    it 'Tests given name' {

        $Objects = Format-SwarmNameApostrophe -Name "sam o'donnell" | Test-FormatNameApostrophe

        $Objects.GivenName     | Should -BeExactly 'Sam'
        $Objects.Surname       | Should -BeExactly "O'Donnell"
        $Objects.FirstName     | Should -BeExactly 'Sam'
        $Objects.LastName      | Should -BeExactly "O'Donnell"
        $Objects.EditedLastName | Should -BeExactly 'ODonnell'
        $Objects.DisplayName   | Should -BeExactly "Sam O'Donnell"
        $Objects.UserName      | Should -BeExactly 'odons'
        $Objects.EmailAddress  | Should -BeExactly "Sam.O'Donnell@swarm.com"
        $Objects.PrimarySMTP   | Should -BeExactly "Sam.O'Donnell@swarm.com"
        $Objects.ProxyAddress1 | Should -BeExactly 'odons@swarm.com'
        $Objects.ProxyAddress2 | Should -BeExactly 'odons@swarm.co.nz'
        $Objects.ProxyAddress3 | Should -BeExactly "Sam.O'Donnell@swarm.co.nz"

    }

}