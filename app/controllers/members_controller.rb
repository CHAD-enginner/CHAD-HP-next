class MembersController < ApplicationController

  def index            #ブラウザには、現在所属している期生しか表示させないので四期生、五期生が増えるにしたがってここを変更しなければならない。一年ごとにHPを更新するスパンだとそんなに重荷ではないからおっけ！
    @rupp = Kisei.find(1)
    @firstkisei = Kisei.find(2)
    @secondkisei = Kisei.find(3)
    @thirdkisei = Kisei.find(4)
  end

end

