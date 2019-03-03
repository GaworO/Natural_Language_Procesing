---
title: "Women's E-Commerce Clothing Reviews"
author: "Aleksandra Gawor  , Mikolaj Gronowski"
date: "5 stycznia 2019"
output:
  html_document:
    keep_md: yes
    self_contained: no
---







```r
knitr::opts_chunk$set(echo = TRUE)

dat2 <- read.csv("Womens.csv", header=T, na.strings=c(""," ","NA"))
```

# Introduction 

This dataset includes 23486 rows and 10 feature variables. Each row corresponds to a customer review, and includes the variables:

Clothing ID: Integer Categorical variable that refers to the specific piece being reviewed.
Age: Positive Integer variable of the reviewers age.
Title: String variable for the title of the review.
Review Text: String variable for the review body.
Rating: Positive Ordinal Integer variable for the product score granted by the customer from 1 Worst, to 5 Best.
Recommended IND: Binary variable stating where the customer recommends the product where 1 is recommended, 0 is not recommended.
Positive Feedback Count: Positive Integer documenting the number of other customers who found this review positive.
Division Name: Categorical name of the product high level division.
Department Name: Categorical name of the product department name.
Class Name: Categorical name of the product class name.

source : https://www.kaggle.com/nicapotato/womens-ecommerce-clothing-reviews/home


In our data set we will try to explore trends in the customer reviews from an anonymized women clothing E-commerce platform.

# 1 - Looking into data set


First step is to clean our data set and look if there are any empty cells. 

<table>
<caption>View of the first row of table</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> X </th>
   <th style="text-align:right;"> Clothing.ID </th>
   <th style="text-align:right;"> Age </th>
   <th style="text-align:left;"> Title </th>
   <th style="text-align:left;"> Review.Text </th>
   <th style="text-align:right;"> Rating </th>
   <th style="text-align:right;"> Recommended.IND </th>
   <th style="text-align:right;"> Positive.Feedback.Count </th>
   <th style="text-align:left;"> Division.Name </th>
   <th style="text-align:left;"> Department.Name </th>
   <th style="text-align:left;"> Class.Name </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1077 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> Some major design flaws </td>
   <td style="text-align:left;"> I had such high hopes for this dress and really wanted it to work for me. i initially ordered the petite small (my usual size) but i found this to be outrageously small. so small in fact that i could not zip it up! i reordered it in petite medium, which was just ok. overall, the top half was comfortable and fit nicely, but the bottom half had a very tight under layer and several somewhat cheap (net) over layers. imo, a major design flaw was the net over layer sewn directly into the zipper - it c </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> General </td>
   <td style="text-align:left;"> Dresses </td>
   <td style="text-align:left;"> Dresses </td>
  </tr>
</tbody>
</table>

There are 4697 empty cells. In these step we get rid of them.
After first cleaning in our dataset we have 19662 observations and 11 variables 


# 2 - Distributon of individual variables 


```r
list = c("Clothing.ID","Age" , "Rating" , "Recommended.IND" ,"Positive.Feedback.Count")
summary(data.full[list])
```

```
##   Clothing.ID          Age            Rating      Recommended.IND 
##  Min.   :   1.0   Min.   :18.00   Min.   :1.000   Min.   :0.0000  
##  1st Qu.: 861.0   1st Qu.:34.00   1st Qu.:4.000   1st Qu.:1.0000  
##  Median : 936.0   Median :41.00   Median :5.000   Median :1.0000  
##  Mean   : 921.3   Mean   :43.26   Mean   :4.183   Mean   :0.8182  
##  3rd Qu.:1078.0   3rd Qu.:52.00   3rd Qu.:5.000   3rd Qu.:1.0000  
##  Max.   :1205.0   Max.   :99.00   Max.   :5.000   Max.   :1.0000  
##  Positive.Feedback.Count
##  Min.   :  0.000        
##  1st Qu.:  0.000        
##  Median :  1.000        
##  Mean   :  2.652        
##  3rd Qu.:  3.000        
##  Max.   :122.000
```


Looking threw our summary we can see that the biggest median is in the variables age and Clothing ID. This result is resonable becouse those 2 variables have big numbers in their column. Clothing ID numbers can have values even to a number over a thousand and Age value can also have a big values. Both of those columns represent continous variables.

In this part the focus will be on the values that are represented by numbers.

We look deeper into data to look see what is going inside. 

#Densities

We looked into densities of two values that made sense the most to look into. 
First one was Age , we wanted to see how the density of age of our customers look like. 
From the graph we can see that the biggest value is near the age of 35.
This means customers in that age are our biggest target. 


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/pressure-1.png)<!-- -->

Second density to look closer to was Positive Feedback Count. We wanted to see how the denisty of positive feedbacks looked like. 
As we can see the biggest number on a density plot is near zero. 
Which means that not that many people might have left a positive feedback.


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

To look into other numberic variables we used bar graphs to see how the data looks like. 

##Recomendation of a product 

In the graph below we can see that most of the customers 81% recomended the product and 18% didn't.


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

Next variable we looked more closely to is Rating. This is a categorical variable which can be scored from values 1 to 5. 
On the graph we can see that the biggest bar is on the number 5, so 55% of people which left the rating rated the prodcut with the highest possible values.


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


#Divison Name 

Next variable shows that the biggest number of items is in the section General.

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


#Departament Name 

To look closer into the products , we counted which of the product has the most occurances in our database. 
The most visible product was Tops with 8715 occurances.

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

#Class Name 

We also wanted to know the count of each of the products. 
The biggest one was Dresses. 

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-10-1.png)<!-- -->



#Product popularity

It was also important to see which of the products had the biggest popularity.
Products with id 1087 , 862 and 1094 have the biggest popularity in the whole database. We can see in the table that the most popular product have occured in our data base 871 times.

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;color: black;"> Number of an item </th>
   <th style="text-align:right;color: black;"> Occuances of an item </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 1078 </td>
   <td style="text-align:right;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 871 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 862 </td>
   <td style="text-align:right;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 658 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 1094 </td>
   <td style="text-align:right;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 651 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1081 </td>
   <td style="text-align:right;font-weight: bold;"> 487 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 829 </td>
   <td style="text-align:right;font-weight: bold;"> 452 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 872 </td>
   <td style="text-align:right;font-weight: bold;"> 450 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 1110 </td>
   <td style="text-align:right;font-weight: bold;"> 419 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 868 </td>
   <td style="text-align:right;font-weight: bold;"> 370 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 895 </td>
   <td style="text-align:right;font-weight: bold;"> 336 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> 867 </td>
   <td style="text-align:right;font-weight: bold;"> 291 </td>
  </tr>
</tbody>
</table>


# 3 - Multivariative Distibution 

Next step was to look into variables and see if there are any coorelations between them. 


# Categorical Variables

First variables where : Division Name and Departament Name. 


```
##     Division Name Departament Name Frequency
## 1         General          Bottoms      2121
## 2  General Petite          Bottoms      1063
## 3       Initmates          Bottoms         0
## 4         General          Dresses      3165
## 5  General Petite          Dresses      2206
## 6       Initmates          Dresses         0
## 7         General         Intimate         0
## 8  General Petite         Intimate       188
## 9       Initmates         Intimate      1220
## 10        General          Jackets       547
## 11 General Petite          Jackets       332
## 12      Initmates          Jackets         0
## 13        General             Tops      5743
## 14 General Petite             Tops      2970
## 15      Initmates             Tops         0
## 16        General            Trend        88
## 17 General Petite            Trend        19
## 18      Initmates            Trend         0
```

As we can see the biggest heat is between Tops in the section General. From the heatmap we can assume that in section General theree is the biggest occurances of Tops and Dresses. In case of section General Petite the situation is exactlly the same. 

It was also important to see the percentage distribution of the same variables. 



![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-14-1.png)<!-- -->


The same action was done between variables Class Name and Departament Name. 









![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

From the graphs we can see thet the biggest freaquency is between Knits and Tops and also between Dresses and Dresses. 


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-18-1.png)<!-- -->
 
We can see that the biggest heat is between Knits and General and Dresses and General. 


# 3.2 -  Continuous Variables on Continuous Variables

We looked also into scatter plots with marginal densities for continous variables Age and Clothing ID. 
Other numberical variables didn't make sense to make scatter plots for them becouse they included categories for example variable Rating. 

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-19-1.png)<!-- -->

We can see that on this graph most of the variables focus near the valu O. We can also notice that the values are slightly coorelated.


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-20-1.png)<!-- -->


# 4 - Text Analysis



```
## # A tibble: 316 x 2
##    word           n
##    <chr>      <int>
##  1 love        8948
##  2 perfect     3772
##  3 flattering  3517
##  4 beautiful   2960
##  5 pretty      2194
##  6 good        1956
##  7 true        1695
##  8 white       1529
##  9 lovely      1072
## 10 gorgeous    1048
## # ... with 306 more rows
```

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;color: black;"> sentiment </th>
   <th style="text-align:right;color: black;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> negative </td>
   <td style="text-align:right;font-weight: bold;font-weight: bold;color: white;background-color: #D7261E;"> 4782 </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;font-weight: bold;color: white;background-color: #26c350;"> positive </td>
   <td style="text-align:right;font-weight: bold;font-weight: bold;color: white;background-color: #26c350;"> 2006 </td>
  </tr>
</tbody>
</table>


Positive Negative Count in Recomended IND 

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-22-1.png)<!-- -->
Positive Negative Count in Rating


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-23-1.png)<!-- -->


![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-24-1.png)<!-- -->





```
## # A tibble: 1,770 x 3
##    word        sentiment     n
##    <chr>       <chr>     <int>
##  1 love        positive   8948
##  2 top         positive   7405
##  3 like        positive   7149
##  4 great       positive   6114
##  5 perfect     positive   3772
##  6 flattering  positive   3517
##  7 well        positive   3386
##  8 soft        positive   3343
##  9 comfortable positive   3057
## 10 cute        positive   3041
## # ... with 1,760 more rows
```

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-25-1.png)<!-- -->



![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-26-1.png)<!-- -->


4.2 - Text mining analysis 


```
##            used  (Mb) gc trigger   (Mb)  max used   (Mb)
## Ncells  4465792 136.3    7822788  238.8   7822788  238.8
## Vcells 83754409 639.0  186588426 1423.6 153827074 1173.7
```

<!--html_preserve--><div id="htmlwidget-3e5e472419bcdc1af4f4" style="width:672px;height:480px;" class="wordcloud2 html-widget"></div>
<script type="application/json" data-for="htmlwidget-3e5e472419bcdc1af4f4">{"x":{"word":["love","great","dress","cute","beautiful","top","perfect","pretty","fit","nice","flattering","runs","lovely","comfortable","comfy","gorgeous","summer","soft","sweater","shirt","small","super","fun","color","quality","fabric","unique","large","pants","skirt","versatile","adorable","big","like","fall","just","tee","casual","jeans","design","size","piece","style","jacket","good","favorite","blouse","short","amazing","classic","work","stylish","easy","little","cozy","colors","really","long","wanted","staple","new","much","best","person","poor","better","tank","feminine","one","basic","boxy","wear","stunning","tunic","made","print","cut","look","material","huge","disappointed","well","simple","elegant","way","looks","spring","awesome","petite","back","odd","pictured","white","expected","ever","buy","right","flowy","light","sizing","chic","coat","classy","loved","shape","fits","thin","bit","warm","details","vest","worth","different","cardigan","black","weird","disappointing","price","sweet","unflattering","shorts","fabulous","pattern","cool","detail","leggings","get","retailer","sheer","another","high","tight","lightweight","comfort","perfection","see","sleeves","must","wonderful","wide","absolutely","itchy","bad","pant","quite","sexy","winter","everyday","every","day","wardrobe","wish","blue","yes","strange","looking","body","true","maxi","lace","length","almost","jean","yet","purchase","waist","denim","please","compliments","enough","time","beauty","can","suit","darling","fantastic","swing","feel","find","awkward","even","picture","zipper","interesting","jumpsuit","run","need","layering","vintage","busty","photo","wow","product","everything","bust","loose","idea","meh","want","cheap","sale","twist","romper","tall","first","two","modern","delicate","red","girls","season","flirty","beware","wash","bought","low","terrible","beautifully","still","timeless","okay","wrong","romantic","plaid","green","happy","needs","simply","surprisingly","front","scratchy","many","breezy","heavy","lots","weight","chest","excellent","issues","fitting","special","petites","arms","cropped","type","makes","embroidery","pockets","peplum","retro","order","bottom","try","curvy","weather","cuter","sweatshirt","boho","surprise","pink","sizes","poncho","make","around","execution","pair","extremely","pilcro","tent","lot","poorly","recommend","dressy","slip","shorter","colorful","baggy","neck","figure","cords","perfectly","full","exactly","shapeless","buttons","finally","winner","cotton","transitional","airy","take","prettier","model","online","maternity","stiff","cutest","women","hoped","dream","wearing","addition","sure","beach","hot","curves","blazer","maybe","close","stretch","floral","shoulders","dreamy","bulky","oversized","definitely","going","kind","return","throw","frumpy","nothing","button","skinny","closet","horrible","clean","vibrant","sad","maeve","hips","concept","knit","effortless","thick","tts","bright","sack","drape","statement","shoulder","waisted","swingy","wait","dry","funky","overall","review","snug","cover","ladies","everyone","smaller","surprised","keeper","fitted","something","legs","art","larger","party","fence","now","crop","extra","silk","version","functional","armholes","looked","practical","pullover","never","transition","flow","shown","flare","put","navy","peasant","flaws","obsessed","bohemian","swimsuit","flowing","slimming","relaxed","year","keep","nicely","sized","trendy","hopes","tricky","average","disappointment","fan","flimsy","tiny","sadly","overpriced","slim","mixed","neckline","pricey","misleading","live","lining","detailing","sleeve","win","shrunk","feels","item","goes","impressed","pass","washed","hem","last","totally","shrinks","arm","got","holiday","unusual","attractive","sooo","potential","ivory","reviews","quirky","stripes","weekend","returned","brand","elegance","gals","fell","exquisite","days","outfit","bathing","cardi","awful","might","holes","texture","girl","midi","types","add","truly","crazy","sheds","wedding","linen","completely","tights","lbd","justice","construction","striped","orange","apart","eye","grey","occasion","always","hip","sophisticated","worn","occasions","photos","came","flair","seasons","billowy","bra","embroidered","soooo","old","slightly","summery","nope","bring","coverage","versitile","lounge","structured","fancy","hate","cream","expectations","people","easily","mark","fab","think","taller","falls","autumn","trend","structure","buttondown","night","fine","theory","luxurious","stretches","travel","dressed","velvet","though","ordered","miss","thought","problem","patterns","tad","works","use","unexpected","washing","socks","sloppy","yellow","ruffle","charming","straight","less","narrow","side","play","meets","flaw","worked","dots","careful","neutral","bigger","else","glad","found","vibe","belt","dresses","penny","figures","rejoice","pop","issue","styling","broad","hit","features","purple","polyester","thing","pictures","whimsical","real","turtleneck","rise","chinos","cheaply","may","life","money","wrap","roomy","stretchy","sides","cape","trench","designed","alternative","read","metallic","change","terrific","ruffled","appropriate","loving","anything","swim","spin","fashionable","pear","straps","leg","pocket","store","lars","gray","beyond","longer","butt","halter","versitle","description","hourglass","form","ready","torso","except","flawed","wool","pills","however","liked","robe","seems","rich","fashion","needed","second","tshirt","went","say","bottoms","shaped","sleek","nicer","problems","flannel","spectacular","shift","trousers","blah","hoodie","busts","pic","things","excited","snap","tried","undecided","adds","flowers","gold","someone","line","layer","lines","byron","said","dissapointed","enormous","collar","uniquely","anywhere","fave","darker","crops","impossible","horribly","polka","difficult","ethereal","touch","sight","shirtdress","sold","stitching","business","wearable","inconsistent","cup","chambray","blousy","gift","gone","kimono","regular","required","felt","stop","tops","pajamas","delightful","chests","potato","sleep","bomber","shimmer","tone","broke","henley","mine","uncomfortable","warmer","twice","frame","agree","catching","option","unless","support","highly","feelings","softest","updated","amazingly","hanger","anyone","prints","kinda","oddly","dark","recommended","subtle","muumuu","flexible","ill","omg","deep","adore","loves","bummed","clingy","away","pajama","girly","delight","hard","ripped","boyfriend","silky","stunner","sparkly","years","edgy","heart","care","coral","pjs","center","pleasant","dye","usual","late","cashmere","missing","professional","forgiving","busted","room","instant","sparkle","fresh","detailed","mod","underwhelmed","incredibly","graphic","polished","shouldered","unexpectedly","lined","snags","missed","reality","fragile","cami","mess","far","dainty","beading","without","draped","feeling","snag","appears","muted","voluminous","substantial","least","know","goddess","fix","deceiving","executed","yoga","mix","used","early","despite","plain","tailoring","evening","whole","dirty","middle","star","turquoise","affordable","chested","skort","come","jogger","glove","elastic","others","hold","pregnant","resist","certain","shade","seen","unfortunate","suits","softness","multi","shimmery","rock","woman","faded","bummer","topper","patchwork","solid","crochet","everywhere","nightgown","wider","gigantic","end","choice","reservations","original","expect","places","seriously","shapes","described","done","funny","striking","fuzzy","typical","fabrics","believe","sundress","deal","essential","torsos","pleasantly","yuck","husband","jumper","ran","young","house","birthday","joggers","holidays","heaven","returning","incredible","cups","lean","machine","chunky","non","pencil","expensive","mother","vegan","flutter","mom","skin","left","bold","tie","purchased","give","part","stay","major","flat","boring","massive","wonderfully","cost","falling","distressed","printed","unimpressed","lingerie","tag","rest","western","actually","lounging","worst","luxury","slouchy","beige","didnt","garden","damaged","seams","unfortunately","function","sporty","luv","divine","owned","absolute","space","cowl","european","avoid","workout","babydoll","tailored","revealing","flares","chemise","thinner","ideal","decent","touches","preppy","legging","flows","mustard","step","sleeved","differently","confortable","dull","unwearable","stevies","together","quickly","pleased","roll","million","three","tons","thighs","vanity","received","number","hidden","wasted","olive","compliment","sewn","hits","ankle","drapes","seemed","pros","chino","correct","inspired","satisfied","garment","bow","shrink","higher","thinking","dolan","looser","pilling","silhouette","proportions","round","annoying","cold","butter","surprising","draping","tell","hug","stretched","date","versatility","otherwise","clown","split","seam","forward","appeal","breathtaking","mini","fabulously","lil","sells","accessory","break","floaty","volume","website","show","lacking","stand","slight","drapey","immediately","complete","across","washable","bag","washes","splurge","buttery","circus","nights","advertised","favorites","wife","alterations","sheath","showstopper","ugh","disappoints","jewel","rainy","sorry","flatter","artsy","raspberry","scoop","duster","coolest","height","crisp","torn","tags","smile","fair","dimensions","peach","culottes","pieces","investment","hugging","took","chesty","caveats","busy","loungewear","outdoor","effortlessly","factor","sent","thread","dressing","georgeous","cocktail","already","diff","shrank","constructed","lady","brighten","sassy","signature","strapless","getting","apply","gem","cargo","dear","puffy","floreat","whimsy","plus","steal","planning","unsure","cooler","cord","ball","rather","air","options","purchasing","pleasing","saw","help","upholstery","happened","undershirt","rocks","purpose","sparkles","stripe","comes","aesthetic","greatest","maintenance","muscular","thru","treasure","mazing","sweetest","defective","yikes","write","zip","goodness","skirts","dinner","gotta","polo","band","lower","smell","built","ski","cons","watch","frock","colorfast","dind","failed","meadow","possibilities","medium","hand","adorbs","thanks","slits","coverup","fox","pleated","spot","patch","area","frames","meet","note","holy","faulty","hideous","movement","fav","ridiculously","confusing","bodies","probably","painting","playful","yay","cat","alright","traditional","liner","confused","instructions","ice","knew","embellishment","precious","exotic","royal","ones","mid","clothes","tough","west","living","several","cheeky","flower","sun","exceeded","leather","offer","paige","capri","thank","knock","home","heck","unstructured","slender","pilcros","ordering","poofy","smart","jury","buyer","month","post","specific","giant","especially","amp","tweed","insanely","outstanding","ribbed","swallowed","pregnancy","transparent","comfortably","imagined","wine","office","fur","lighter","strangely","transitioning","brainer","darn","younger","birds","hello","welcome","arrived","ways","die","suede","check","pefect","alter","pics","shedding","ugly","gets","misses","sunny","hooded","times","bother","pleats","underwhelming","baby","doll","cowlneck","multiple","tiered","call","charm","sturdy","depends","athletic","dashed","soooooo","rayon","silver","also","send","tickled","customers","failure","country","ish","bikini","rules","poppy","understand","festive","snow","hole","loungers","colored","wonky","impractical","questionable","shows","pernette","climates","outfits","fever","sunday","understated","jersey","clever","edges","sticks","standout","patterned","sweatercoat","rough","bunches","irl","pizazz","bralette","clipdot","manette","skip","chance","smells","bomb","pairs","sleepwear","restock","waste","lacks","evenings","sort","trust","past","lokka","swagger","closely","yarn","frayed","piling","riding","classically","animal","upscale","victorian","sequins","class","definition","ended","boobs","umm","gapes","open","endowed","delaney","lately","flipping","eva","gauze","calves","folks","audrey","hepburn","boy","difference","aware","tassels","reese","tracy","belle","pay","bizarre","reviewers","key","sister","seamed","workmanship","success","spandex","snuggly","dot","weekends","complicated","zippers","job","durable","today","pressing","serious","proper","set","christmas","pale","swings","dowdy","crush","regret","shame","strikes","contemporary","cant","femine","vary","heat","self","treat","terribly","shrinkage","sky","ahoy","forgot","oops","paid","crooked","harem","defined","nearly","mauve","cutesy","capris","necessary","amount","tea","lifesaver","cleaning","worthy","designer","rue","smock","significantly","booty","breasts","instantly","impulse","uneven","relaxing","sleeveless","femininity","crimson","fussy","warning","vivid","useful","challenging","nautical","spots","synthetic","slit","comfrotable","traveling","mumu","cling","passed","age","rave","hemline","textures","fails","appreciate","receive","minutes","florida","error","placement","pleat","everygirl","man","pops","gal","stain","oomph","maillot","friendly","sooooo","lovers","conversationalist","downhill","thumbs","bodice","immediate","matter","mango","mild","ahead","seem","double","save","finest","college","distressing","priced","corduroy","match","half","dramatic","instead","fuller","scene","wild","sweaters","boxier","brighter","haw","yee","moto","static","knitted","flattery","upgraded","caftan","sunshine","let","wears","stock","atlanta","comfotable","lilac","list","interpretation","trying","blush","lacy","overly","bucks","cleaned","esque","pinkish","painful","thanksgiving","nah","empire","hei","beads","rip","sag","lovelier","prob","reason","tanks","debating","drawbacks","present","belted","jammies","zippered","incomplete","maaji","blanket","reversible","fringe","crown","paper","vacation","standard","sliced","hangs","similar","universally","talk","reservation","overalls","negative","inaccurate","purchases","sublime","tweaking","strike","paradise","craftsmanship","mind","bubble","hang","sea","comically","hippy","wrinkled","postpartum","craftmanship","weighty","lovin","canary","beachy","diner","palm","challenged","culotte","reminds","esp","breath","binding","forget","stellar","summertime","mock","world","tulle","boyish","seasonal","holding","horses","pilly","pick","depicted","softer","working","bunny","glam","yogis","city","swinging","asap","crafted","hides","coloring","kidding","complimentary","total","drawstring","anticipated","bleeds","breaker","eyelet","grab","boots","channeling","ingalls","laura","sleeping","consider","keeping","dreams","princess","drab","neoprene","ruching","lack","newest","versital","tip","matronly","formal","lost","ruined","ego","pull","awsome","growing","fools","neat","poof","slenderizing","search","bare","site","proportion","brown","skirted","surpassed","kick","gaps","blues","springy","combination","goofy","wished","pure","stevie","sweat","zippery","cuffs","possible","dud","faux","lbs","artistic","lose","chilly","dissappointed","lab","skimpy","belly","glance","backside","opening","fatal","effort","comments","fast","somewhat","attention","cutout","angel","wrinkles","warmth","drop","suited","minor","grandmas","wrinkly","control","ehhh","guess","hype","buying","gap","sew","flowey","glorious","hugs","south","pilazzo","stained","petal","threads","met","spicy","candy","camisole","gotten","camo","shapely","misrepresented","creative","bride","curve","layers","beatiful","thrilled","arrows","boys","four","ruins","tighter","gross","mediocre","voom","stable","gown","chirpy","texas","recommendation","subtly","initial","alas","score","foot","fat","tummy","swimming","oversize","tuck","overwhelming","honey","confidence","daughter","asymmetrical","foxy","closure","carpet","shocker","cosy","calia","moo","gosh","head","fairisle","emerald","motif","bof","meant","ironing","requires","bling","jolly","estella","delivers","winters","booster","heartbroken","stomach","freezing","paris","taupe","picotage","slimmer","simplicity","dotted","masterpiece","yummy","unlined","dazzling","tones","quick","cagrcoal","oerson","mehh","sweep","parka","humid","puffer","pretry","australian","antoher","completes","huuuuge","covering","norm","mediterenian","asset","sooooooooo","alless","loveee","beadwork","lauer","positively","subdued","possibly","boobies","weirdly","ultimately","move","hint","jardin","adn","htis","itchytown","balance","childish","prety","slimmingly","deodorant","purchaser","jeggings","moms","gerat","uniform","fal","started","colorways","comforable","stinky","perfer","summers","cocoon","primula","imperial","ordinary","sheet","happyinpdx","itch","bun","oven","previously","reviewed","rme","calssic","inseam","relived","equals","cake","hood","exciting","bautiful","staright","farm","respects","paisley","thr","brought","substantially","eyecatching","chloe","fitness","sleepable","fest","irish","flings","bryson","adjustments","complexions","tan","amazingness","sooooooooooooo","loveliness","yeh","dive","ine","cherished","convertible","demi","skarlett","ease","messy","drycleaning","handkerchief","luck","evanthe","sunglasses","awesomesauce","dramatically","madly","bell","running","bridgette","beutiful","pirate","collection","along","later","generously","capsule","dusters","alluring","droopy","shortwaisted","gorgeus","map","bronze","bohoranna","rhapsody","gill","ingenious","ranna","twins","available","property","taxes","eptite","stil","square","grid","balloons","halfway","uhhhmmmazing","mission","greenhouse","glamour","shortt","agreement","whim","added","isses","rust","pep","max","walk","capelet","bunched","moment","killer","loompa","oompa","buckles","surpring","purrrfect","pijamas","supportive","controversial","disagree","refreshing","sherpa","prim","pantie","holds","football","player","disapppointing","waaay","valentine","unbalanced","suprisingly","myyyy","lovelovelovelovelove","arts","crafts","broader","cayucos","aquarelle","darts","powerful","whoa","beautivul","burlap","liking","stranger","treated","seeeee","noisy","diamond","heihei","girlie","filmsy","quirk","noce","redo","bough","picnic","combat","florilege","perennial","transformed","grabber","wants","attempt","dont","picked","conforming","current","differrent","framws","yoo","comparison","kicking","yasss","companion","elevates","mohair","dried","snappy","fool","pity","chevron","mint","loaded","indispensable","huesca","combine","indigo","saddlebags","lodge","lattice","feminie","inset","flatteuing","normal","laundry","load","staining","pizzazz","separately","stet","symmetry","gaping","smalllllll","lanky","models","barely","bum","covered","uber","caught","swoon","notice","scout","endless","improvements","agreeing","says","postcard","thigh","jumpsuits","flashy","broken","loooooooow","crossback","sacky","ceremony","civil","tylho","lovelovelove","peeps","nightbelle","gto","othewise","midnight","apparent","lurex","mountain","yummysweater","swearter","inexpensive","maker","leave","accented","eghhh","kitten","deliciously","museum","thi","underestimated","evokes","wowed","tightness","entirely","netural","prone","comcerns","lasts","contrast","impress","peasy","sisterhood","cadigan","styish","bothers","acrylic","older","speaking","stargazer","attering","packable","dancing","youthful","breeze","thousand","beauiful","plenty","recalled","sticky","adding","symmetric","dealbreaker","curvey","background","bainbridge","bretin","complement","takes","revelations","desgn","minis","truth","desired","leaves","rail","stunningly","triangles","babes","breastfeeding","thrown","practically","wonderland","inconsistently","incongruous","blouses","memories","generally","skier","jumpers","cats","cuteandcomfy","discontinue","aqua","frilly","removing","streeeeetches","finished","golden","detach","limitations","ruched","scream","tape","popsicle","est","men","utilitarian","prickly","sienna","vanilla","nonetheless","punch","duty","anther","launder","baggie","pronounced","surprizingly","scratchier","beautigul","boxey","looove","fabri","yum","loops","ahhhhmazing","carefree","openings","pancholicious","honor","maid","value","stilts","trim","align","majorly","nellore","guest","sharp","excessive","shrinking","receiving","fyi","couture","points","chiffon","sparrow","tablecloth","ignore","moon","mountaire","couple","uniqueness","won","feature","ample","betrayed","linebacker","cas","experiment","frankenstein","shine","quilted","comfey","checks","mona","daytripper","tanned","upsize","butterflies","coolness","blowsy","muddy","ultra","lisette","relax","produbt","raincoat","nymph","express","latest","cabled","crossover","wierd","based","condition","cardy","armpit","cutouts","transfers","slik","test","sbags","burgandy","grunge","granny","goodie","oldie","continues","individuality","beautuful","forties","sweats","angles","morrissey","cargos","dangerous","faves","shearling","conscious","socially","soo","tapestry","consept","rides","charlie","priceless","vintag","sitting","whimsically","active","tenfold","outerwear","handled","dubious","nostalgia","critters","besutiful","errands","letdown","manufacturing","process","buns","necessity","hadley","asymetric","knockoff","info","favs","yeah","ahirt","rex","blossom","heartbreakingly","toy","heads","school","tweak","anthousai","enjoy","quintessential","alteration","plan","female","clock","gauzy","varied","varies","saga","gourgeous","alone","yep","searching","tomorrow","eggplant","partum","ruggy","gym","believed","dorotea","allroads","betcha","longing","breathtakingly","exchange","marigold","differ","quietly","reconstructed","sweatshirts","elevated","eclectic","twisted","pepper","salt","professor","examine","magically","magica","notch","cahrm","disapppointed","wore","irresistible","unstable","history","swtr","turtlenceck","coloration","rare","disproportionate","pricy","discription","loooovvvvveee","anorak","geneva","channel","gaines","inner","joanna","petties","boutique","blend","promising","tropicale","popcorn","reservedly","merit","bedtime","boyshort","edge","hanging","garish","tehse","confirmed","petra","spirit","sprites","tenty","shriks","somehow","swingier","vey","porportions","lie","lwd","bunching","sewing","boiled","trumpet","prettie","bla","ecru","harder","abso","folklorica","unreal","smooth","murky","refined","loooooooove","clings","littel","beauitful","steep","warned","point","armpits","swooned","native","fraying","underarm","horrendous","galore","yessssss","dip","toes","bpttoms","mamaw","period","zoe","tla","downtime","loooooove","prepared","jacker","swag","marrakech","wicked","grandma","flowly","bend","luxuriously","fairy","shirts","highlights","floreale","aquaflora","filtting","drinks","maintains","stamped","problematic","purchse","perhaps","bows","trimmed","beat","coh","ichy","daceous","tulling","reviewer","darla","curtain","shower","tweet","cloth","stone","seasonless","vieques","bridal","linty","cinched","ribbon","mad","usa","moulinette","soeurs","graduation","blended","lovethis","jackets","king","houndstooth","framed","lasted","winh","plush","prep","judge","knitwear","tested","paint","realllly","pineapples","waffle","styled","student","storm","portion","pose","prima","actual","prototype","racerback","jane","mama","awwww","pseudo","menopause","teeny","gum","stumpy","descriptions","appear","intense","pooch","hav","hte","nippley","diagonal","functionality","ode","often","ackerley","toothpicks","greatness","plum","next","spray","stretching","supremely","nancydee","family","grayish","puppy","apple","lux","versions","whimper","betty","grable","struggle","discolors","perrfect","dang","hoping","bread","since","andfestive","mullet","delicious","foiled","ness","making","spy","flight","sigh","violetta","relationship","leathers","realllllly","lemonade","catch","rehearsal","wearings","bam","seson","cooommfey","wilder","invisible","milkmaid","swiss","imaginative","eastern","laid","beardedlady","ludlow","joliette","guilt","ups","awkwardly","joy","plunge","stat","planned","periwinkle","pilcor","elorn","skit","snl","annoyed","drive","dynamic","bustier","allelujah","wins","maximizes","thereof","monet","huuuuuuge","femme","urrrrgh","highest","choral","boom","getter","carissima","ladylike","amaze","elegent","epitome","parisienne","cinderella","translation","closest","stylist","cardie","dilemma","trade","happening","asymmetric","unforgetable","spanx","geous","gor","preggers","cohesive","availability","stores","tapered","destroy","shortcake","strawberry","entire","rediculously","jodphurs","receipt","upon","fina","glory","morning","subtlety","mood","puts","inconsistency","statuesque","tallettes","luscious","luster","hmmmm","sense","club","joined","trent","vertically","flown","widening","minus","sending","babe","whiz","dumpy","casul","elegantly","kelby","hopeful","argh","boxes","checked","askew","nylon","hawk","vers","fade","collage","prairie","trouble","weekender","buttonholes","bloomed","brunch","geometric","chicks","burnout","valo","deletta","umbrellas","monaco","beauties","buxom","wake","sloft","amoret","matetial","boot","nala","eat","ter","courderoy","lune","august","mis","deaux","larkhill","slayed","cadet","collared","awe","fail","juneberry","fly","clients","april","five","promise","derby","kentucky","medora","southern","thermal","buttondowns","dah","individual","pursuit","overwhelmed","courage","suffer","tneck","embellishments","ideas","placed","ruffles","whenever","build","inspiration","florals","sweatpants","understatement","textile","silhouettes","scooped","elevenses","knows","hesistant","palid","tartan","throwing","hawing","hemming","skinnier","simlpe","shirtwaist","sweaterknit","undone","pillsville","materials","boxt","creases","utility","prarie","watching","saundra","handwash","differences","catchy","towel","pleating","heavier","flouncy","reliable","strecth","smoking","accidentally","rompers","coatigan","box","raiding","unreasonably","fress","posey","grew","mostly","cupro","freshly","crotch","jegging","xxs","awesomeness","hook","lnd","forming","fourth","july","presses","hollywood","claim","fixed","akemi","kin","engagement","alicia","catalog","shear","everybody","exoected","wallpaper","listen","word","phase","schoolboy","blazy","trek","villain","aside","eyes","infatuated","caution","proceed","unicorn","gonna","toned","universal","upcoming","crinkled","crushing","werid","horse","track","tickles","grease","start","ans","jingle","wayyy","unusial","bass","wings","hawthorne","expectecd","potatoes","drool","superb","dead","carry","downside","posy","dooooown","anastasia","vitamin","lay","pricing","garme","gypsy","patagonia","merino","exposure","properly","expecting","bolt","single","cosiest","prettiest","everday","sunset","significant","flexibility","portland","sarah","draperies","opinions","varying","splendid","poufy","notta","swam","gathering","inch","zing","loooove","east","kennedy","ooooo","awww","realize","fantastically","fantabulous","overlay","natori","covers","sins","spell","flapper","colour","reallly","ikat","project","shapless","select","variation","fluorescent","springtime","choir","preaching","lift","luisa","hurray","cigar","fantasies","comor","horrifying","child","menswear","wispy","cartagena","unfinished","sotra","cheshire","undergarments","minimalism","justified","bands","stripped","imo","pilled","loosely","faint","allison","created","craving","marsupial","unnatural","backwards","town","behemian","trick","easiest","service","underneath","maroon","certainly","tucked","ginormous","basics","per","week","colorway","sherbrooke","stopper","third","regualr","washers","matched","stripey","flatteringly","wowza","ahahahaha","conversation","written","prepare","defines","loren","sophia","shot","touring","bodysuit","tore","elements","hacking","hanky","pinky","rocket","leisure","nightshirt","cleo","jumsuit","discount","sandstripe","scalloped","tropic","ridiculous","nursing","cleavage","fans","lacey","clumsy","bloomsbury","decide","coverall","image","opted","quincy","hippie","revie","fabrication","arty","pul","folklore","caved","beautifil","flamingo","yellowy","asymetrical","amnesty","isn","exchanged","verstile","emroidered","lycra","waaaaay","stretchs","remover","barefoot","heels","became","spotty","chinolicious","discolored","minimalist","laundering","wintery","brannan","sit","exceptional","renaissance","stunna","alive","heavyweight","offers","knits","neira","rosie","blissfully","poodle","xsp","recomend","purrfect","among","denins","sfylish","festoon","modest","view","friend","clothing","bonus","combo","scared","amd","sleepy","camel","royalty","peachy","either","loreley","hats","birdy","irregular","fierce","riley","selling","anytime","demin","seamstress","qualifier","calvin","klein","jelly","somebody","designs","ugg","variety","compfy","mumsy","bouse","supima","alpinia","cuddly","badly","lifetime","belia","collector","alittle","handles","protect","lol","rain","iconic","epic","trial","perfecto","hands","foret","lucsiously","stick","allowed","hourglasses","magic","zowie","existent","waistband","elasticity","rose","bottomed","comforts","creature","constricting","comnfortable","accent","ages","island","symmetrical","islander","watermelon","pulls","beauttiful","costs","gorgous","cheesy","yer","sheen","fades","ick","trouser","lint","magnet","sheik","ewwww","risk","greek","caz","ensemble","gooooorgeous","cage","rib","surmountable","sandscape","deba","disco","relly","beautifullllll","snail","snails","stinkin","builder","teen","openwork","pinstripe","considerations","sell","daily","unhappy","elbows","carefull","underarms","grabbed","toddler","wowser","afternoon","saturday","wanderlust","bulk","cacoon","enveloping","cocoony","catog","whispering","wisteria","decided","odor","strong","daisy","market","graphics","grass","manner","righter","imperfect","exceeds","expectation","flairs","customer","cheerful","bermuda","midsection","wowsa","doily","slice","flar","dres","variable","mature","jackie","ohio","span","caveat","mesh","pokes","pulled","isle","interest","visual","cruise","humongous","bliss","sava","reading","happiness","pom","strappy","ubiquitous","bodied","rag","horror","swanky","shortedr","jimmy","snaggariffic","deco","hair","kelly","frustrating","bump","unbelievably","fupa","eek","raglan","ribbing","abroad","mavis","briar","comment","washer","pool","breezie","akward","upgrade","bravo","aesthetically","yesteryear","yore","reunion","impressive","whisper","veille","slipped","knee","cna","notfor","squat","patterning","cutie","approachable","phenomenal","willowy","lounger","terrace","ehh","glass","goodthing","avant","garde","kate","middleton","literally","changed","upkeep","frustration","stuffy","discrepency","shimmering","bailey","looooove","components","junk","trunk","laugh","free","hues","noticed","freestyle","ehhhh","wee","shinier","haute","rocking","jade","spruced","breathable","opinion","north","circa","dare","likee","throughout","deliver","lanka","flaiir","naughty","brilliantly","gathered","odering","tanl","poly","dime","worsk","terrifically","persimmon","accurately","reflect","daybreak","satisfactory","leifsdottir","ask","planet","strangly","skylar","california","fill","happens","shell","bhanuni","instincts","trusted","sits","waistline","datetop","military","pas","waiting","silly","bettors","asking","cheaper","yup","positive","greatcsweater","rises","bathrobe","turner","lumpy","pin","lavender","chemical","stains","heavenly","prefect","sexiest","strap","transferred","commets","previous","outing","perf","frills","figured","potentail","intricate","stitches","answered","god","prayers","permanently","graceful","bradshaw","carrie","sigourney","weaver","smartly","unusually","lauzet","backless","surpise","aka","nod","runway","itchiness","beachside","invites","shimmy","hospital","hipsters","boob","brilliance","temperatures","costume","femenine","column","checkerboard","lampshade","tanktop","tends","stuck","siamese","lovelove","falll","coarse","fringed","farrah","elysian","slinky","stayed","con","washi","hide","adores","silouett","modification","kilter","occassion","peasanty","message","sweatering","flowwy","individuals","coins","fountain","rear","artistry","tees","indecisive","dept","deter","misnomer","unruly","fleur","sahm","impression","goldilocks","proportioned","skylark","indoors","thoroughly","beast","multiples","chauvet","mobility","sac","artist","incorrect","springlike","provides","turning","studious","words","hated","rockets","watercolor","theres","jeunet","supah","complaint","gateway","tankini","mosaic","chokey","deceptively","albert","scrumptious","decadent","beaded","pirchase","flared","helps","correctly","chameleon","strip","unattractive","ribboned","gadget","stays","stated","armhole","altered","tunics","rolls","embroidary","names","wrapped","frompy","expexted","xxsp","saizing","anrtho","pays","feb","listed","fleece","fruns","soooooooooooooo","ruffly","foamy","hooray","oddity","majority","smokes","bettys","stands","sensational","adjusting","constantly","corner","event","notes","apartment","ack","appealing","shimmers","dolman","dryer","unshapely","deciding","outer","personality","scrubs","stride","inside","serif","formed","poplin","curious","juxtaposition","isabella","sinclair","unqiue","fleeced","tula","shawl","gorgeously","twiggy","creativity","sensitive","nora","stylists","raspberries","scottish","ginerva","extreme","bee","utiful","boatneck","buzz","tied","bees","bumble","looooong","boogie","jungle","anti","stops","example","stunninng","gingham","renamed","sian","car","levis","wedgie","future","eclat","grecian","bulge","fixes","tailor","pillowcase","socal","general","seea","challange","mighty","inconsistant","sultry","repeat","coincidence","workhorse","known","tensile","yank","adjustable","cross","mensware","cuteness","flatters","accurate","measurements","bordeaux","entrancing","parties"],"freq":[1867,1791,1653,1553,1407,1177,816,672,613,528,506,489,474,473,455,446,446,437,425,348,340,334,328,311,296,284,276,276,265,262,256,244,239,238,234,226,221,217,215,211,204,201,198,197,196,189,183,181,174,170,165,162,153,153,152,151,149,148,145,144,138,135,135,135,131,126,124,122,121,120,119,117,116,112,111,110,109,108,107,104,104,102,101,98,97,96,94,93,88,88,88,86,85,85,85,83,82,81,78,77,77,76,75,74,74,74,74,73,72,72,71,71,71,70,69,69,68,68,67,67,67,66,65,64,64,63,62,62,61,61,60,60,59,59,57,57,56,54,54,54,54,52,52,52,52,52,52,51,51,50,50,50,49,49,49,48,47,47,47,46,46,45,45,45,44,43,43,43,42,42,42,42,41,41,41,41,41,40,40,39,39,39,38,38,38,38,37,37,37,37,37,37,37,36,36,36,36,35,35,34,34,34,34,33,33,32,32,32,32,32,32,32,32,32,32,32,32,31,31,31,31,31,30,30,30,30,30,30,29,29,29,29,29,29,28,28,28,28,27,27,27,27,27,27,27,27,26,26,26,26,26,26,26,26,26,25,25,25,25,25,25,25,25,25,25,25,25,25,25,24,24,24,24,24,24,24,24,24,24,24,24,24,24,23,23,23,23,23,23,22,22,22,22,22,21,21,21,21,21,21,21,21,20,20,20,20,20,20,20,20,20,20,20,20,20,20,19,19,19,19,19,19,19,19,19,19,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,18,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,15,15,15,15,15,15,15,15,15,15,15,15,15,15,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-light","minSize":0,"weightFactor":0.192822710230316,"backgroundColor":"grey","gridSize":0,"minRotation":-0.785398163397448,"maxRotation":0.785398163397448,"shuffle":true,"rotateRatio":0.4,"shape":"circle","ellipticity":0.65,"figBase64":null,"hover":null},"evals":[],"jsHooks":{"render":[{"code":"function(el,x){\n                        console.log(123);\n                        if(!iii){\n                          window.location.reload();\n                          iii = False;\n\n                        }\n  }","data":null}]}}</script><!--/html_preserve-->


4.3  - Sentiment Analysis 

In this part we created 2 new variables that would show the length of the review and count of the words in the review. 

Creation of a new varibales  Review length and Count words




Firstly we looked on the highlights of all the sentences. 
As we can see in the opended html , positive values are marked as green and negative as red. 
In many cases Review or Topic had more than one sentence for those cases values were averaged. 
Values that we recived are polinearity values. 


There were duplicated values than the polarity was averaged.








<table>
<caption>Data base after changes</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> X </th>
   <th style="text-align:right;"> Clothing.ID </th>
   <th style="text-align:right;"> Age </th>
   <th style="text-align:left;"> Title </th>
   <th style="text-align:left;"> Review.Text </th>
   <th style="text-align:right;"> Rating </th>
   <th style="text-align:right;"> Recommended.IND </th>
   <th style="text-align:right;"> Positive.Feedback.Count </th>
   <th style="text-align:left;"> Division.Name </th>
   <th style="text-align:left;"> Department.Name </th>
   <th style="text-align:left;"> Class.Name </th>
   <th style="text-align:right;"> Review.length </th>
   <th style="text-align:right;"> Count.words </th>
   <th style="text-align:right;"> Review.Text.polarity </th>
   <th style="text-align:right;"> Title.polarity </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1077 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> Some major design flaws </td>
   <td style="text-align:left;"> I had such high hopes for this dress and really wanted it to work for me. i initially ordered the petite small (my usual size) but i found this to be outrageously small. so small in fact that i could not zip it up! i reordered it in petite medium, which was just ok. overall, the top half was comfortable and fit nicely, but the bottom half had a very tight under layer and several somewhat cheap (net) over layers. imo, a major design flaw was the net over layer sewn directly into the zipper - it c </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> General </td>
   <td style="text-align:left;"> Dresses </td>
   <td style="text-align:left;"> Dresses </td>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> 97 </td>
   <td style="text-align:right;"> 0.1958504 </td>
   <td style="text-align:right;"> -0.0500000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1049 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> My favorite buy! </td>
   <td style="text-align:left;"> I love, love, love this jumpsuit. it's fun, flirty, and fabulous! every time i wear it, i get nothing but great compliments! </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:left;"> General Petite </td>
   <td style="text-align:left;"> Bottoms </td>
   <td style="text-align:left;"> Pants </td>
   <td style="text-align:right;"> 124 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 0.6248575 </td>
   <td style="text-align:right;"> 0.4330127 </td>
  </tr>
</tbody>
</table>

#  Coorelation Matrix

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-32-1.png)<!-- -->

We can see coorelation between Review Text and Count words. 
Coorleation is also noticable between Rating and Recomended ID , Rating and Title Polarity,  Review Text Polarity and Title Polarity.

Based on the results we decided to get rid of variable Count Words. 


After that we have also changed the categorical variables to dummy variables so they can be used in our algoriths. 




<table>
<caption>Database</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> X </th>
   <th style="text-align:right;"> Clothing.ID </th>
   <th style="text-align:right;"> Age </th>
   <th style="text-align:right;"> Rating_1 </th>
   <th style="text-align:right;"> Rating_2 </th>
   <th style="text-align:right;"> Rating_3 </th>
   <th style="text-align:right;"> Rating_4 </th>
   <th style="text-align:right;"> Rating_5 </th>
   <th style="text-align:right;"> Recommended.IND </th>
   <th style="text-align:right;"> Positive.Feedback.Count </th>
   <th style="text-align:right;"> Division.Name_General </th>
   <th style="text-align:right;"> Division.Name_General Petite </th>
   <th style="text-align:right;"> Division.Name_Initmates </th>
   <th style="text-align:right;"> Department.Name_Bottoms </th>
   <th style="text-align:right;"> Department.Name_Dresses </th>
   <th style="text-align:right;"> Department.Name_Intimate </th>
   <th style="text-align:right;"> Department.Name_Jackets </th>
   <th style="text-align:right;"> Department.Name_Tops </th>
   <th style="text-align:right;"> Department.Name_Trend </th>
   <th style="text-align:right;"> Class.Name_Blouses </th>
   <th style="text-align:right;"> Class.Name_Casual bottoms </th>
   <th style="text-align:right;"> Class.Name_Chemises </th>
   <th style="text-align:right;"> Class.Name_Dresses </th>
   <th style="text-align:right;"> Class.Name_Fine gauge </th>
   <th style="text-align:right;"> Class.Name_Intimates </th>
   <th style="text-align:right;"> Class.Name_Jackets </th>
   <th style="text-align:right;"> Class.Name_Jeans </th>
   <th style="text-align:right;"> Class.Name_Knits </th>
   <th style="text-align:right;"> Class.Name_Layering </th>
   <th style="text-align:right;"> Class.Name_Legwear </th>
   <th style="text-align:right;"> Class.Name_Lounge </th>
   <th style="text-align:right;"> Class.Name_Outerwear </th>
   <th style="text-align:right;"> Class.Name_Pants </th>
   <th style="text-align:right;"> Class.Name_Shorts </th>
   <th style="text-align:right;"> Class.Name_Skirts </th>
   <th style="text-align:right;"> Class.Name_Sleep </th>
   <th style="text-align:right;"> Class.Name_Sweaters </th>
   <th style="text-align:right;"> Class.Name_Swim </th>
   <th style="text-align:right;"> Class.Name_Trend </th>
   <th style="text-align:right;"> Review.length </th>
   <th style="text-align:right;"> Review.Text.polarity </th>
   <th style="text-align:right;"> Title.polarity </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1077 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> 0.1958504 </td>
   <td style="text-align:right;"> -0.0500000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 1049 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 124 </td>
   <td style="text-align:right;"> 0.6248575 </td>
   <td style="text-align:right;"> 0.4330127 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 847 </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.3800528 </td>
   <td style="text-align:right;"> 0.3535534 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1080 </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 488 </td>
   <td style="text-align:right;"> 0.0322549 </td>
   <td style="text-align:right;"> -0.0536656 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 858 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 496 </td>
   <td style="text-align:right;"> -0.0016122 </td>
   <td style="text-align:right;"> 0.5773503 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 858 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 482 </td>
   <td style="text-align:right;"> 0.0407561 </td>
   <td style="text-align:right;"> 0.1118034 </td>
  </tr>
</tbody>
</table>

# 5 - Algorithms 

Neural Network 


```
## Recommended.IND ~ Clothing.ID + Age + Positive.Feedback.Count + 
##     Rating_1 + Rating_2 + Rating_3 + Rating_4 + Rating_5 + Division.Name_General + 
##     Division.Name_General_Petite + Division.Name_Initmates + 
##     Department.Name_Bottoms + Department.Name_Dresses + Department.Name_Intimate + 
##     Department.Name_Jackets + Department.Name_Tops + Department.Name_Trend + 
##     Class.Name_Blouses + Class.Name_Casual_bottoms + Class.Name_Chemises + 
##     Class.Name_Dresses + Class.Name_Fine_gauge + Class.Name_Intimates + 
##     Class.Name_Jackets + Class.Name_Jeans + Class.Name_Knits + 
##     Class.Name_Layering + Class.Name_Legwear + Class.Name_Lounge + 
##     Class.Name_Outerwear + Class.Name_Pants + Class.Name_Shorts + 
##     Class.Name_Skirts + Class.Name_Sleep + Class.Name_Sweaters + 
##     Class.Name_Swim + Class.Name_Trend + Review.length + Title.polarity + 
##     Review.Text.polarity
```

<table>
<caption>Database</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> V1 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.9999919491 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.6817395491 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;"> 0.6817395491 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 16 </td>
   <td style="text-align:right;"> 0.6817395491 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 17 </td>
   <td style="text-align:right;"> 0.6817395491 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 18 </td>
   <td style="text-align:right;"> 0.6817395491 </td>
  </tr>
</tbody>
</table>

```
## [1] 0.1671042096
```



Classification TREES

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-37-1.png)<!-- -->

```
## Call:
## rpart(formula = model1.formula, data = data.full.final.train, 
##     method = "class")
##   n= 13764 
## 
##              CP nsplit    rel error       xerror          xstd
## 1 0.33038229376      0 1.0000000000 1.0000000000 0.01815932786
## 2 0.15613682093      1 0.6696177062 0.6696177062 0.01539113406
## 3 0.01750503018      3 0.3573440644 0.3573440644 0.01159840426
## 4 0.01000000000      5 0.3223340040 0.3279678068 0.01114289902
## 
## Variable importance
##             Rating_2             Rating_1             Rating_3 
##                   38                   29                   28 
##       Title.polarity Review.Text.polarity 
##                    3                    2 
## 
## Node number 1: 13764 observations,    complexity param=0.3303822938
##   predicted class=1  expected loss=0.1805434467  P(node) =1
##     class counts:  2485 11279
##    probabilities: 0.181 0.819 
##   left son=2 (943 obs) right son=3 (12821 obs)
##   Primary splits:
##       Rating_2             < 0.5             to the right, improve=1153.4346770, (0 missing)
##       Rating_5             < 0.5             to the left,  improve=1094.8682010, (0 missing)
##       Title.polarity       < 0.1092401069    to the left,  improve= 847.6222936, (0 missing)
##       Review.Text.polarity < 0.03605923244   to the left,  improve= 759.7091632, (0 missing)
##       Rating_1             < 0.5             to the right, improve= 659.7147388, (0 missing)
## 
## Node number 2: 943 observations
##   predicted class=0  expected loss=0.06468716861  P(node) =0.06851206045
##     class counts:   882    61
##    probabilities: 0.935 0.065 
## 
## Node number 3: 12821 observations,    complexity param=0.1561368209
##   predicted class=1  expected loss=0.1250292489  P(node) =0.9314879396
##     class counts:  1603 11218
##    probabilities: 0.125 0.875 
##   left son=6 (1732 obs) right son=7 (11089 obs)
##   Primary splits:
##       Rating_3             < 0.5             to the right, improve=853.2838430, (0 missing)
##       Rating_1             < 0.5             to the right, improve=755.3748769, (0 missing)
##       Rating_5             < 0.5             to the left,  improve=572.7649322, (0 missing)
##       Title.polarity       < 0.1092401069    to the left,  improve=466.3997070, (0 missing)
##       Review.Text.polarity < 0.03568664908   to the left,  improve=434.7817683, (0 missing)
##   Surrogate splits:
##       Title.polarity       < -0.8429451561   to the left,  agree=0.866, adj=0.008, (0 split)
##       Review.Text.polarity < -0.5499709958   to the left,  agree=0.865, adj=0.003, (0 split)
##       X                    < 23482           to the right, agree=0.865, adj=0.001, (0 split)
## 
## Node number 6: 1732 observations,    complexity param=0.01750503018
##   predicted class=0  expected loss=0.4133949192  P(node) =0.1258355129
##     class counts:  1016   716
##    probabilities: 0.587 0.413 
##   left son=12 (1038 obs) right son=13 (694 obs)
##   Primary splits:
##       Title.polarity          < 0.0002435854123 to the left,  improve=30.855221210, (0 missing)
##       Review.Text.polarity    < 0.009723229141  to the left,  improve=21.910966470, (0 missing)
##       Review.length           < 390.5           to the left,  improve= 5.460391207, (0 missing)
##       Age                     < 65.5            to the left,  improve= 3.985880419, (0 missing)
##       Positive.Feedback.Count < 16.5            to the right, improve= 3.094488597, (0 missing)
##   Surrogate splits:
##       X                  < 23375.5         to the left,  agree=0.601, adj=0.004, (0 split)
##       Clothing.ID        < 1175            to the left,  agree=0.601, adj=0.004, (0 split)
##       Class.Name_Legwear < 0.5             to the left,  agree=0.601, adj=0.004, (0 split)
##       Review.length      < 500.5           to the left,  agree=0.601, adj=0.004, (0 split)
##       Age                < 77.5            to the left,  agree=0.600, adj=0.003, (0 split)
## 
## Node number 7: 11089 observations,    complexity param=0.1561368209
##   predicted class=1  expected loss=0.05293534133  P(node) =0.8056524266
##     class counts:   587 10502
##    probabilities: 0.053 0.947 
##   left son=14 (486 obs) right son=15 (10603 obs)
##   Primary splits:
##       Rating_1                < 0.5             to the right, improve=892.076190100, (0 missing)
##       Title.polarity          < -0.2182476436   to the left,  improve=174.005020200, (0 missing)
##       Review.Text.polarity    < 0.00537195543   to the left,  improve=167.675734300, (0 missing)
##       Rating_5                < 0.5             to the left,  improve=127.965461100, (0 missing)
##       Positive.Feedback.Count < 3.5             to the right, improve=  4.191854418, (0 missing)
##   Surrogate splits:
##       Title.polarity       < -0.6999635521   to the left,  agree=0.958, adj=0.049, (0 split)
##       Review.Text.polarity < -0.1571398391   to the left,  agree=0.958, adj=0.039, (0 split)
## 
## Node number 12: 1038 observations
##   predicted class=0  expected loss=0.3362235067  P(node) =0.0754141238
##     class counts:   689   349
##    probabilities: 0.664 0.336 
## 
## Node number 13: 694 observations,    complexity param=0.01750503018
##   predicted class=1  expected loss=0.4711815562  P(node) =0.05042138913
##     class counts:   327   367
##    probabilities: 0.471 0.529 
##   left son=26 (155 obs) right son=27 (539 obs)
##   Primary splits:
##       Review.Text.polarity < 0.002756194474  to the left,  improve=12.994404510, (0 missing)
##       Title.polarity       < 0.7242049646    to the left,  improve= 5.679875907, (0 missing)
##       X                    < 1385            to the left,  improve= 2.498899392, (0 missing)
##       Clothing.ID          < 1130            to the left,  improve= 1.871753130, (0 missing)
##       Age                  < 33.5            to the left,  improve= 1.367765833, (0 missing)
##   Surrogate splits:
##       X < 23467.5         to the right, agree=0.778, adj=0.006, (0 split)
## 
## Node number 14: 486 observations
##   predicted class=0  expected loss=0.01028806584  P(node) =0.03530950305
##     class counts:   481     5
##    probabilities: 0.990 0.010 
## 
## Node number 15: 10603 observations
##   predicted class=1  expected loss=0.009997170612  P(node) =0.7703429236
##     class counts:   106 10497
##    probabilities: 0.010 0.990 
## 
## Node number 26: 155 observations
##   predicted class=0  expected loss=0.3483870968  P(node) =0.01126126126
##     class counts:   101    54
##    probabilities: 0.652 0.348 
## 
## Node number 27: 539 observations
##   predicted class=1  expected loss=0.4192949907  P(node) =0.03916012787
##     class counts:   226   313
##    probabilities: 0.419 0.581
```







![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-38-1.png)<!-- -->








```
## Confusion Matrix and Statistics
## 
##    pred.tree4
##        0    1
##   0  948  142
##   1  218 4590
##                                                   
##                Accuracy : 0.9389624               
##                  95% CI : (0.9325476, 0.9449385)  
##     No Information Rate : 0.8023059               
##     P-Value [Acc > NIR] : < 0.00000000000000022204
##                                                   
##                   Kappa : 0.8027426               
##  Mcnemar's Test P-Value : 0.0000772268            
##                                                   
##             Sensitivity : 0.8130360               
##             Specificity : 0.9699915               
##          Pos Pred Value : 0.8697248               
##          Neg Pred Value : 0.9546589               
##              Prevalence : 0.1976941               
##          Detection Rate : 0.1607325               
##    Detection Prevalence : 0.1848084               
##       Balanced Accuracy : 0.8915138               
##                                                   
##        'Positive' Class : 0                       
## 
```

Miss Classification error :


```
## [1] 0.06103763988
```



```
## 
## Classification tree:
## rpart(formula = model1.formula, data = data.full.final.train, 
##     method = "class", minsplit = 500, minbucket = 250, maxdepth = 30, 
##     cp = -1)
## 
## Variables actually used in tree construction:
##  [1] Age                     Class.Name_Knits       
##  [3] Clothing.ID             Department.Name_Dresses
##  [5] Positive.Feedback.Count Rating_1               
##  [7] Rating_2                Rating_3               
##  [9] Rating_4                Review.length          
## [11] Review.Text.polarity    Title.polarity         
## [13] X                      
## 
## Root node error: 2485/13764 = 0.18054345
## 
## n= 13764 
## 
##             CP nsplit  rel error     xerror        xstd
## 1  0.330382294      0 1.00000000 1.00000000 0.018159328
## 2  0.156136821      1 0.66961771 0.66961771 0.015391134
## 3  0.017102616      3 0.35734406 0.35734406 0.011598404
## 4  0.000000000      5 0.32313883 0.32595573 0.011110810
## 5 -1.000000000     27 0.32313883 0.32595573 0.011110810
```

```
## 4 
## 4
```

```
## [1] 0
```

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-41-1.png)<!-- -->


Random Forest 


```
## 
## Call:
##  randomForest(formula = model.formula4, data = data.full.final.rf.train2) 
##                Type of random forest: regression
##                      Number of trees: 500
## No. of variables tried at each split: 13
## 
##           Mean of squared residuals: 0.04180626734
##                     % Var explained: 72.55
```

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-42-1.png)<!-- -->


```
## 
## Call:
##  randomForest(formula = model.formula4, data = data.full.final.rf.train2,      ntree = 100, sampsize = 10000, mtry = 8, importance = TRUE) 
##                Type of random forest: regression
##                      Number of trees: 100
## No. of variables tried at each split: 8
## 
##           Mean of squared residuals: 0.04136579018
##                     % Var explained: 72.84
```

```r
varImpPlot(data.full.final.rf2,  
           sort = T,
           n.var=5,
           main="Top 5 - Variable Importance")
```

![](Aleksandra_Gawor_Miko³aj_Gronowski_files/figure-html/unnamed-chunk-44-1.png)<!-- -->




