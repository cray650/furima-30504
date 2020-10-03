FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@akai.com"}
    password              {"00000000"}
    password_confirmation {password}
    first_name            {"やまだ"}
    last_name             {"てすと"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"テスト"}
    birthday              {"1930-02-01"}
  end
end