***Лабораторна робота № 5***

Для лабораторної роботи необхідно завантажити zip файл з даними за посиланням: «https://www.dropbox.com/s/i9wi47oyhfb7qlh/rprog_data_specdata.zip?dl=0».

**1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення.**

```
pmean("specdata", "sulfate", 1:10)
pmean("specdata", "sulfate", 250:255)
pmean("specdata", "sulfate", 55)
pmean("specdata", "sulfate", 200)
pmean("specdata", "nitrate")
```
Результат:
___
```
> pmean("specdata", "sulfate", 1:10)
[1] 4.064128
> pmean("specdata", "sulfate", 250:255)
[1] 4.358325
> pmean("specdata", "sulfate", 55)
[1] 3.587319
> pmean("specdata", "sulfate", 200)
[1] 4.390778
> pmean("specdata", "nitrate")
[1] 1.702932
```
___


**2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень.**
```
complete("specdata", 1)
complete("specdata", 300)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", c(20, 156, 208))
complete("specdata", 50:60)
complete("specdata", 250:260)
```
Результат:
___
```
> complete("specdata", 1)
  id nobs
1  1  117
> complete("specdata", 300)
   id nobs
1 300  927
> complete("specdata", c(2, 4, 8, 10, 12))
  id nobs
1  2 1041
2  4  474
3  8  192
4 10  148
5 12   96
> complete("specdata", c(20, 156, 208))
   id nobs
1  20  124
2 156  298
3 208  121
> complete("specdata", 50:60)
   id nobs
1  50  459
2  51  193
3  52  812
4  53  342
5  54  219
6  55  372
7  56  642
8  57  452
9  58  391
10 59  445
11 60  448
> complete("specdata", 250:260)
    id nobs
1  250  180
2  251   27
3  252  509
4  253  531
5  254  437
6  255  657
7  256   96
8  257  886
9  258  444
10 259   76
11 260  386
```
___

**3. Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію
«cor» з параметрами за замовчуванням.**
```
cr <- corr("specdata", 150)
head(cr); summary(cr)

cr <- corr("specdata", 400)
head(cr); summary(cr)

cr <- corr("specdata", 5000)
head(cr); summary(cr) ; length(cr)
```
Результат:
___
```
> cr <- corr("specdata", 150)
> head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> 
> cr <- corr("specdata", 400)
> head(cr); summary(cr)
[1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 
> 
> cr <- corr("specdata", 5000)
> head(cr); summary(cr) ; length(cr)
numeric(0)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
                                                
[1] 0
```
___
