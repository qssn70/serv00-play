#!/bin/perl

$addflag=0;
$flag=0;
$content=qq{
#added by toolbox begin
export TZ=Asia/Shanghai
export EDITOR=vim
export VISUAL=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
alias l='ls -ltr'
alias pp='ps aux'
alias ss='cd ~/toolbox && ./start.sh'
#added by toolbox end
};

while(<>){
  if( /^#added by toolbox begin/){
    $addflag=1;
    $flag=1;
    print $content, "\n";
  }else{
    if (/^#added by toolbox end/){
      $flag=0;
    }else{
      print if $flag==0;
    }
  }
}

if( $addflag==0 ){
  print $content, "\n";
}