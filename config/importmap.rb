# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin 'alpinejs', to: 'https://ga.jspm.io/npm:alpinejs@3.10.3/dist/module.esm.js'
