
const path = require('path');
const fs = require('fs');

var rootPath = path.resolve(__dirname, 'corporations');
var files = fs.readdirSync(rootPath)
              .filter(dir => fs.statSync(path.resolve(rootPath, dir)).isDirectory())
              .map(dir => fs.readdirSync(path.resolve(rootPath, dir))
                            .filter(filename => !filename.includes('.easylist') && !filename.includes('README'))
                            .map(filename => path.resolve(rootPath, dir, filename)))
              .reduce((all, dirFiles) => all.concat(dirFiles), [])

files.forEach(file => {
  var fileContents = fs.readFileSync(file, { encoding: 'utf-8' });

  var easy = '[Adblock Plus 2.0]\n' +
                fileContents.split('\n')
                .map(line => line.match(/^0\.0\.0\.0[\s]+([^#\s]*)/))
                .filter(result => result != null)
                .map(result => result[1])
                .map(domain => [ `||${domain}^`,
                                 `||${domain}^$popup`,
                                 `||${domain}^$third-party` ].join('\n'))
                .join('\n');

  fs.writeFileSync(file + '.easylist', easy);
})
