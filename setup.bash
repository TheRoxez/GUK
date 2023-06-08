#!/bin/bash
 
kurulum_dy="~/Downloads/setup/pkg/"

result=$(sudo /Applications/VMware\ <agent\ path\ EDR.app>)
 
# Kullanıcının işletim sistemi sürümünü çekme
macos_surumu=$(sw_vers -productVersion)

s1="7.2.2"
s2="7.2.1"
s3="7.2.0"

# Karşılaştırma yapılacak ajan sürümleri
declare -A agent_surumleri=(
["13.0.0"]=$s1
["12.1.0"]=$s1
["11.2.0"]=$s2
["12.0.1"]=$s1
["13.1.0"]=$s1
["12.2.0"]=$s1
["13.0.1"]=$s1
["13.2.0"]=$s1
["12.2.1"]=$s1
["13.3.0"]=$s1
["12.4.0"]=$s1
["13.2.1"]=$s1
["12.3.1"]=$s1
["12.5.0"]=$s1
["13.3.1"]=$s1
["11.6.0"]=$s3
["11.5.1"]=$s3
["12.6.0"]=$s1
["12.5.1"]=$s1
["12.6.1"]=$s1
["12.6.2"]=$s1
["11.7.4"]=$s1
["11.6.5"]=$s2
["11.6.6"]=$s1
["11.7.6"]=$s1
["11.6.7"]=$s1
["10.15.7"]=$s1
)

# Komut çıktısını kontrol etme  
if [[ $result ]]; then
  echo "Ajan mevcut. Kontroller yapılıyor"
  
  # Uygun ajanın kurulumunu gerçekleştirmesi
  uygun_surum=${agent_surumleri[$macos_surumu]}
  
  if [[ $uygun_surum == $s1 ]]; then # 7.2.2 
    komut="sudo installer -pkg \"$kurulum_dy$s1/cbcs.pkg\" -target /Applications"
    eval $komut
  elif [[ $uygun_surum == $s2 ]]; then # 7.2.1
    komut="sudo installer -pkg \"$kurulum_dy$s2/cbcs.pkg\" -target /Applications"
    eval $komut
  elif [[ $uygun_surum == $s3 ]]; then # 7.2.0
    komut="sudo installer -pkg \"$kurulum_dy$s3/cbcs.pkg\" -target /Applications"
    eval $komut
  else
    echo "Dosya yüklenemiyor"
else
    echo "Ajan bulunamadı uygun sürüm yükleniyor"
    # Uygun ajanın kurulumunu gerçekleştirmesi
    uygun_surum=${agent_surumleri[$macos_surumu]}
    if [[ $uygun_surum = $s1 ]]; then # 7.2.2 
        komut="sudo installer -pkg ${kurulum_dy}${s1}/cbcs.pkg -target /Applications"
        eval $komut
    elif [[ $uygun_surum = $s2 ]]; then # 7.2.1
        komut="sudo installer -pkg ${kurulum_dy}${s2}/cbcs.pkg -target /Applications"
        eval $komut
    elif [[ $uygun_surum = $s3 ]]; then # 7.2.0
        komut="sudo installer -pkg ${kurulum_dy}${s3}/cbcs.pkg -target /Applications"
        eval $komut
    else
        echo "Dosya yüklenemiyor"
    fi
fi
