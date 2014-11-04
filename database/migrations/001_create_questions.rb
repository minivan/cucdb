Sequel.migration do
  up do
    create_table(:questions) do
      primary_key :id
      String :number, null: false
      String :text,   null: false
      String :answer, null: false
      String :criteria
      String :comment
      String :source
      String :team
      String :author
      String :game_identifier, null: false
    end
  end

  down do
    drop_table(:questions)
  end
end