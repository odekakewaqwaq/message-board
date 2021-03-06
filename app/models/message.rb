class Message < ActiveRecord::Base
    #名前は入力必須かつ20文字以内
    validates:name,length:{maximum:20},presence:true
    #内容は入力必須且つ2文字以上30文字以下
    validates:body,length:{minimum:2,maximum:30},presence:true
end
