# DicodingIOSFundamental
# DicodingIOSFundamentalSubmission
this app is final submission to Dicoding IOS Fundamentan and the architechture using MVVM with Clean Architecture. There are 3 main layers, Presentation, Domain, and Data layers.


- Presentation. Contains the Views and ViewModels. The Presentation layer depends only on the Domain layer.

- Domain. Contains the Models (entities) and UseCases. The UseCase depends on what we need and might not include all repositories. 

- Data. Contains the Repositories. The Repository is what we need to communicate with ReST API or local persistent data like CoreData or Realm. And The Data layer depends only on the Domain Layer. I was modified the example to match my coding style.


you can read full article [here](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)

<img src="https://github.com/helloail/DicodingIOSFundamentalSubmission/blob/foldering/Screenshoot/priview1.png" width="300" height="600"><img src="https://github.com/helloail/DicodingIOSFundamentalSubmission/blob/foldering/Screenshoot/priview2.png" width="300" height="600"><img src="https://github.com/helloail/DicodingIOSFundamentalSubmission/blob/foldering/Screenshoot/priview3.png" width="300" height="600"><img src="https://github.com/helloail/DicodingIOSFundamentalSubmission/blob/foldering/Screenshoot/priview4.png" width="300" height="600"><img src="https://github.com/helloail/DicodingIOSFundamentalSubmission/blob/foldering/Screenshoot/priview5.png" width="300" height="600">


## Harap diperhatikan!

Bagi teman-teman yang masih mengikuti kelas dari dicoding. Silahkan gunakan source ini sebagai bahan referensi, tapi TIDAK untuk disalin secara utuh tanpa tau cara implementasinya.

Ayolah kawan.. Kalian sudah bayar mahal untuk ikut kelas ini, kalian harus dapat ilmunya. Percuma kalian dapat sertifikat dari dicoding kalau di kemudian hari kalian tidak mendapatkan ilmunya dari sini.

Semangat kawan.. Perjalanan masih panjang. Lakukan yang terbaik yang kalian bisa. Silahkan tanya saya jika ada yang kurang dimengerti. Kalau saya bisa bantu, pasti saya dampingi.

Mari kita maju bersama-sama..


## NOTE
coredata in this app can be run, but on progres to refactor in mvvm with clean code architechture
