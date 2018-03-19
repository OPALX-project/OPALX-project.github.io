#!/bin/bash
#
touch tuneresult
exec 6<ic.dat
N="228"
j="1"
while read -u 6 E1 r  pr
# read in Energy, initil R and intial Pr of each SEO from FIXPO output
  do
  echo -n j = 
  echo " Running turn $j / $N"
  echo -n energy= > data.dat 
  echo -n "$E1"  >> data.dat
  echo  ";" >> data.dat

  echo -n r=  >> data.dat
  echo -n "$r" >> data.dat
  echo ";" >> data.dat

  echo -n pr= >> data.dat
  echo -n "$pr" >> data.dat
  echo  ";" >> data.dat
#
# execute OPAL to calculate tuning frquency and store
#
$OPAL_EXE_PATH/opal cyclotron1.in  | grep "Max:"  >> tuneresult
#   
#   
  j=$[$j+1]
done
exec 6<&-
#
# post process
# read in the SEO (ic.dat) result and OPAL into file result.dat  
#
cat tuneresult | awk '{print $5}' > a.data

exec 8<a.data
exec 9<refsol.dat
rm -f result.dat
i="0"
echo "# E nu_r (SEO) nu_z(SEO) nu_r(OPAL-CYCL) nu_z(OPAL-CYCL)" >>result.dat 
while [ $i -lt $N ]
  do 
  read -u 8 ur1
  read -u 8 uz1 
  read -u 9 E ur2 uz2
  echo "$E   $ur2   $uz2   $ur1   $uz1" >>result.dat 
  i=$[$i+1]
done
exec 8<&-
exec 9<&-
#
rm -rf *.stat timing.dat data cyclotron1-trackOrbit.dat *.h5 a.data tuneresult data.datrm -rf timing.dat data.dat *~
