# PowerShell one-liner to decrypt
$hex = ""
$bytes = [byte[]]::new($hex.Length / 2)
for ($i = 0; $i -lt $hex.Length; $i += 2) {
    $bytes[$i / 2] = [convert]::ToByte($hex.Substring($i, 2), 16)
}
$decrypted = [System.Security.Cryptography.ProtectedData]::Unprotect($bytes, $null, 'CurrentUser')
[System.Text.Encoding]::Unicode.GetString($decrypted)
