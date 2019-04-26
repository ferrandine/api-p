# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Eazip.Repo.insert!(%Eazip.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Eazip.Repo
alias Eazip.Clothes.Clothe

Repo.insert!(%Clothe{
  type: "dress",
  image: ""
})

Repo.insert!(%Clothe{
  type: "trouser",
  image: ""
})

Repo.insert!(%Clothe{
  type: "t-shirt",
  image: ""
})

Repo.insert!(%Clothe{
  type: "skirt",
  image: ""
})

Repo.insert!(%Clothe{
  type: "shirt",
  image: ""
})

Repo.insert!(%Clothe{
  type: "pullover",
  image: ""
})

Repo.insert!(%Clothe{
  type: "blazer",
  image: ""
})

Repo.insert!(%Clothe{
  type: "coat",
  image: ""
})
