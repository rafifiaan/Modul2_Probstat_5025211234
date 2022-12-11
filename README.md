# Praktikum Modul 2_Probstat_A_5025211234

 Nama           : Rafi Aliefian Putra Ramadhani        
 NRP            : 5025211234    

## Nomor 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴.

| Responden   | X        | Y        |
|-------------|----------|----------|
| 1 | 78 | 100 |
| 2 | 75 | 95 |
| 3 | 67 | 70 |
| 4 | 77 | 90 |
| 5 | 70 | 90 |
| 6 | 72 | 90 |
| 7 | 78 | 89 |
| 8 | 74 | 90 |
| 9 | 77 | 100 |

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

### 1Poin A
> Carilah standar deviasi dari data selisih pasangan pengamatan tabel di atas.

*Pertama*, masukkan data yang telah ada ke dalam variabel sesuai pengelompokannya.

```R
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```

*Kedua*, cari selisih dari antar data dengan index yang sama. Kemudian, dilakukan pencarian rata-rata dari selisih-selisih tersebut untuk digunakan dalam mencari nilai standar deviasinya dengan rumus sebagai berikut.

```R
difference <- after - before
difference
mean(difference)
sd(difference)
```

![1PointA](https://user-images.githubusercontent.com/91828276/206914887-b5607b7d-4319-41e0-bbfd-a497c5eaa4ea.png)

</br>

### 1 Point B
>Carilah nilai t (p-value).

Solusi dilakukan dengan menggunakan fungsi `t.test()` sebagai berikut dengan parameter masukan data yaitu data kelompok yang telah dikelompokkan pada poin sebelumnya.

```R
t.test(after, before, paired = TRUE)
```

![1PointB](https://user-images.githubusercontent.com/91828276/206914893-60281421-c040-4028-be2b-67716e514825.png)

</br>

### Poin C
>Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

Berdasarkan hasil poin sebelumnya, diketahui bahwa nilai probabilitas dari uji 𝑡 (p-value) adalah 6.003e-05 atau 0.00006003. Karena nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05, maka **hipotesis nol ditolak dan hipotesis alternatif diterima.** 

Hal ini artinya sebelum dan sesudah melakukan aktivitas 𝐴 pada tingkat signifikansi 5%, terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen.

</br>

## Nomor 2
**(Hipotesa 1 Sampel)** Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan 2 library seperti referensi pada modul).
### 2 Point A
>Apakah Anda setuju dengan klaim tersebut?

Setuju, karena dengan rata-rata 23.5000 dari sampel acak dengan standar deviasi 3900 kilometer, maka sangatlah mungkin klaim tersebut valid. Hal itu karena grafik dari persebaran data distribusi normal yang dihasilkan akan lebih pekat di daerah lebih dari 20.000 kilometer dengan asumsi nilai tengah grafik tersebut adalah rata-rata dari sampel acak yang didapatkan.

Selanjutnya, digunakan sebuah package library BSDA untuk membuat solusi permasalahannya.

```R
install.packages("BSDA")
library(BSDA)
```

</br>

### 2 Point B
>Jelaskan maksud dari output yang dihasilkan!

Untuk menyelesaikan nya perlu menggunakan fungsi `tsum.test()` dengan parameter-parameter yang disebutkan pada poin sebelumnya. Hasilnya adalah sebagai berikut.

```R
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```

![2PointB](https://user-images.githubusercontent.com/91828276/206915876-e08783dd-1817-4add-b195-55913cff8ab5.png)

Sehingga dengan interval kepercayaan 95%, rata-rata jarak tempuh mobil per tahun berada di antara 22.726,16 km dan 24.273,84 km. Dengan interval kepercayaan 95% dan dari 100 responden, dapat dibuktikan bahwa rata-rata jarak tempuh mobil per thn lebih dari 20.000 km karena nilai p-value kurang dari tingkat signifikansi 𝛼 = 0.05.

</br>

### 2 Point C
>Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Dikarenakan nilai probabilitas tersebut lebih kecil dibandingkan tingkat signifikansi 𝛼 = 0.05, maka **hipotesis nol ditolak dan hipotesis alternatif diterima.** Sehingga, kesimpulan yang didapatkan yaitu bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.

</br>

## Nomor 3
**(Hipotesa 2 Sampel)** Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut   | Bandung        | Bali       |
|-------------|----------|----------|
| Jumlah Saham              | 19 | 27 |
| Sampel Mean               | 3.64 | 2.79 |
| Sampel Standar Deviasi    | 1.67 | 1.32 |

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil
diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada
rata-ratanya (α= 0.05)? Buatlah:

### 3 Point A
>H0 dan H1(3)

Berdasarkan deskripsi dan data yang terlampir, maka dapat disusun hipotesis H0 dan H1 sebagai berikut.
- H0 ← μ1 = μ2 (rata-rata saham di Bandung sama dengan di Bali)
- H1 ← μ1 ≠ μ2 (rata-rata saham di Bandung tidak sama dengan di Bali)

### 3 Point B
>Hitung sampel statistik(3)

Penyelesaian menggunakan fungsi `tsum.test()` dengan parameter sesuai dengan data pada tabel terlampir. Fungsi tersebut menghasilkan nilai dari sampel statistik.

```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```

![3PointB](https://user-images.githubusercontent.com/91828276/206916717-e1bb864a-e0f7-4c7a-8c75-b15ce71a9ca8.png)

</br>

### 3 Point C
>Lakukan uji statistik (df =2)(5)

Install Package Mosaic untuk membuat S=solusi permasalahan.

```R
install.packages("mosaic")
library(mosaic)
```

Langkah selanjutnya yaitu dengan menggunakan fungsi `plotDist()` untuk mendapatkan gambaran atau visualisasi dari statistik dengan derajat bebas sebesar 2.

```R
plotDist(dist = 't', df = 2, col = "blue")
```

![3PointC](https://user-images.githubusercontent.com/91828276/206916721-23cf5648-99d6-475b-a388-6781a1af0a51.png)

</br>

### 3 Point D
>Nilai Kritikal(3)

Penyelesaian dengan menggunakan fungsi `qchisq()` dengan nilai `df` sesuai dengan yang telah terlampir untuk mendapatkan nilai kritikal.

```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

![3PointD](https://user-images.githubusercontent.com/91828276/206916723-228629ef-0ec3-4ea6-a455-2ccb99cc79f5.png)

</br>

### 3 Point E
>Keputusan(3)

Teori keputusan merupakan teori formal pengambilan keputusan di bawah ketidakpastian. Aksinya adalah `({a}\_{a∈A})` dengan kemungkinan konsekuensinya adalah `({c}_{c∈C})` (tergantung pada keadaan dan tindakan). Sehingga, keputusan dapat diperoleh dengan menggunakan fungsi `t.test`

</br>

### 3 Point F
>Kesimpulan(3)

Dapat disimpulkan bahwa perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik. Namun, akan ada (meski tidak signifikan) jika dipengaruhi oleh nilai kritikal.

</br>

## Nomor 4
**(Anova satu arah)** Seorang Peneliti sedang meneliti spesies dari kucing di ITS. Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.

Jika diketahui dataset pada **https://intip.in/datasetprobstat1** dan H0 adalah tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama, maka kerjakan atau carilah:

### 4 Point A
>Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, dan grup 3). Lalu gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

*Pertama*, masukkan data dari dataset yang disediakan.

```R
dataoneway <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", h = T)
attach(dataoneway)
names(dataoneway)
```

*Kedua*, melakukan grouping sesuai dengan label yang telah ditentukan sekaligus melakukan pengecekan value dalam grup yang dihasilkan.

```R
dataoneway$Group <- as.factor(dataoneway$Group)
dataoneway$Group = factor(dataoneway$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataoneway$Group)
```

![4PointA1](https://user-images.githubusercontent.com/91828276/206918403-d7a5f9aa-7daa-4368-b030-95c4c54958c0.png)

*Ketiga*, membagi tiap valuer menjadi 3 bagian sesuai dengan label grup yang telah dibuat.

```R
Group1 <- subset(dataoneway, Group == "Kucing Oren")
Group2 <- subset(dataoneway, Group == "Kucing Hitam")
Group3 <- subset(dataoneway, Group == "Kucing Putih")
```

*Keempat*, menggambar plot kuantil normal untuk setiap grup untuk melihat distribusi data dan outlier utama dalam homogenitas varians pada masing-masing grup.

```R
qqnorm(Group1$Length)
qqline(Group1$Length)
```

![4PointA2](https://user-images.githubusercontent.com/91828276/206918407-24c912a7-ed61-4fb4-a94f-d74725594abb.png)

```R
qqnorm(Group2$Length)
qqline(Group2$Length)
```

![4PointA3](https://user-images.githubusercontent.com/91828276/206918409-c315cb5f-03c1-48a5-bbc5-8076ba0a81df.png)

```R
qqnorm(Group3$Length)
qqline(Group3$Length)
```

![4PointA4](https://user-images.githubusercontent.com/91828276/206918417-2379f19b-0b6d-4657-a6a8-631d36c7f8b7.png)

</br>

### 4 Point B
>Carilah atau periksalah homogeneity of variances-nya. Berapa nilai p yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?

Penyelesaian untuk mendapatkan homogeneity of variances adalah dengan menggunakan sebuah fungsi yaitu fungsi `bartlett.test()` dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
bartlett.test(Length ~ Group, data = dataoneway)
```

![4PointB](https://user-images.githubusercontent.com/91828276/206918421-582b0ed0-1f3f-4974-a171-96eb075bca51.png)

Dari hasil uji fungsi `bartlett.test()` didapatkan p-value sebesar 0.8054 yang lebih dari nilai 𝛼 = 0.05 sehingga asumsi kesamaan varians terpenuhi.

</br>

### 4 Point C
>Untuk uji ANOVA (satu arah), buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1.

Penyelesaian dari membuat uji anova dan model liniernya yaitu digunakan fungsi `lm()` dan `anova()` dengan parameter dari data yang telah dimasukkan sebelumnya.

```R
model1 = lm(Length ~ Group, data = dataoneway)
anova(model1)
```

![4PointC](https://user-images.githubusercontent.com/91828276/206918424-9bccca33-e2a7-462b-a7f9-fec5b7868773.png)


</br>

### 4 Point D
>Dari hasil poin C, berapakah nilai p? Apa yang dapat Anda simpulkan dari H0?

Melihat dari hasil yang didapatkan pada poin sebelumnya, pada taraf uji 5% didapatkan nilai p-value sebesar 0.0013. 

Sehingga, terdapat perbedaan panjang kucing yang signifikan berdasarkan grupnya.

</br>

### 4 Point E
>Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

Verifikasi jawaban model 1 sebelumnya menggunakan sebuah fungsi yaitu fungsi `TukeyHSD()` dengan parameter model 1 dari AOV sebelumnya.

```R
TukeyHSD(aov(model1))
```

![4PointE](https://user-images.githubusercontent.com/91828276/206918426-ceafb36c-bc2d-4ce6-9ed4-cc5fdc64595b.png)

Dari hasil uji Tukey, dapat dilihat kombinasi dari kelompok mana yang secara signifikan berbeda. Jika menggunakan 𝛼 = 5%, **perbedaan panjang kucing yang signifikan adalah grup 2 (Kucing Hitam) terhadap grup 1 (Kucing Oren) dan grup 3 (Kucing Putih)**.

</br>

### 4 Point F
>Visualisasikan data dengan ggplot2

Penyelesaian menggunakan sebuah fungsi `ggplot()` untuk melakukan visualisasi data.

```R
install.packages("ggplot2")
library("ggplot2")

ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")
```

![4PointF](https://user-images.githubusercontent.com/91828276/206918428-049e520e-f030-4865-a7ef-8a504fba6d7c.png)

</br>

## Nomor 5
**(Anova dua arah)** Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C, dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapatkan [**data hasil eksperimen berikut**](https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view). Dengan data tersebut:

### 5 Point A
>Buatlah plot sederhana untuk visualisasi data

*Pertama*, gunakan beberapa library sebagai berikut.

```R
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
```

*Kedua*, masukkan dan baca dataset yang telah disediakan.

```R
GTL <- read_csv("GTL.csv")
head(GTL)
```

![5PointA1](https://user-images.githubusercontent.com/91828276/206919809-94e386e2-157c-4676-9a7d-335731286978.png)

*Ketiga*, lakukan observasi pada dataset.

```R
str(GTL)
```

![5PointA2](https://user-images.githubusercontent.com/91828276/206919813-19675403-59c4-47c9-ae1e-1f1c39f41f79.png)

*Keempat*, lakukan viasualisasi dengan menggunakan simple plot dengan fungsi `qplot()` sebagai berikut.

```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```

![5PointA3](https://user-images.githubusercontent.com/91828276/206919815-4dd23b05-05b1-4489-979e-fbe4a12547b8.png)

</br>

### 5 Point B
>Lakukan uji ANOVA dua arah untuk 2 faktor

*Pertama*, buat variabel as factor sebagai ANOVA.

```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```

![5PointB1](https://user-images.githubusercontent.com/91828276/206919968-8a68bc10-bcff-4f9f-ac67-43c43577236d.png)

*Kedua*, lakukan analisis of variance (AoV) dengan fungsi `summary(aov())` sebagai berikut.

```R
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

![5PointB2](https://user-images.githubusercontent.com/91828276/206919977-a32f6a24-cfac-4553-ba1d-1db295a9a6eb.png)

</br>

### 5 Point C
>Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Penyelesaian-nya dengan menggunakan sebuah fungsi `group_by()` yang selanjutnya digunakan untuk melakukan data summary dengan fungsi `summarise()` sesuai mean dan standar deviasi yang berlaku sebagai berikut.

```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```

![5PointC](https://user-images.githubusercontent.com/91828276/206919978-75ba38aa-6b2c-4293-b6a9-f538d62edcb2.png)

</br>

### 5 Point D
>Lakukan uji Tukey

Penyelesaian dengan menggunakan sebuah fungsi `TukeyHSD()` sebagai berikut.

```R
tukey <- TukeyHSD(anova)
print(tukey)
```

![5PointD1](https://user-images.githubusercontent.com/91828276/206920078-fe319b1f-4955-4897-997a-f166fed189f8.png)

![5PointD2](https://user-images.githubusercontent.com/91828276/206920080-75e1d7d9-8af6-4eab-9b6f-c24109f72fef.png)

</br>

### 5 Point E
>Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

*Pertama*, buat compact letter display dengan fungsi `multcompLetterS4()` sebagai berikut.

```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```

![5PointE1](https://user-images.githubusercontent.com/91828276/206920082-46a6c07a-3a03-41ce-9d43-b7bb5cdcb222.png)

*Kedua*, tambahkan compact letter display tersebut ke tabel dengan mean dan standar deviasi yang telah dibuat sebelumnya.

```R
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```

![5PointE2](https://user-images.githubusercontent.com/91828276/206920083-299bd247-87f1-47be-a86a-ce9d07c7b07d.png)

</br>

# Alhamdulillah, Terimakasih, Bismillah lulus :)