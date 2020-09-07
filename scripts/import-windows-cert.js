#!/usr/bin/env node

const fs = require('fs')

if (process.platform === 'win32') {
  const decodedCert = Buffer.from(process.env.WINDOWS_CERT_P12, 'base64')
  const certFilename = process.env.WINDOWS_CERT_FILENAME

  fs.writeFile(certFilename, decodedCert, err => {
    if (err) {
      console.error(`Error writing to ${certFilename}: ${err.message | err}`)
      process.exit(1)
    }
  })
}
