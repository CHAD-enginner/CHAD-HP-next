class MembersController < ApplicationController

  def index            #ブラウザには、現在所属している期生しか表示させないので四期生、五期生が増えるにしたがってここを変更しなければならない。一年ごとにHPを更新するスパンだとそんなに重荷ではないからおっけ！
    @rupp = Adkisei.find(1)
    @firstkisei = Adkisei.find(2)
    @secondkisei = Adkisei.find(3)
    @thirdkisei = Adkisei.find(4)
  end

end

