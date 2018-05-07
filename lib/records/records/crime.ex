defmodule Records.Records.Crime do
  use Ecto.Schema
  import Ecto.Changeset


  schema "crimes" do
    field :context, :string
    field :crime_id, :string
    field :crime_type, :string
    field :falls_within, :string
    field :last_outcome_category, :string
    field :latitude, :decimal
    field :location, :string
    field :longitude, :decimal
    field :lsoa_code, :string
    field :lsoa_name, :string
    field :month, :string
    field :reported_by, :string

    timestamps()
  end

  @doc false
  def changeset(crime, attrs) do
    crime
    |> cast(attrs, [:lsoa_code, :lsoa_name, :context, :crime_id, :crime_type, :falls_within, :last_outcome_category, :latitude, :location, :longitude, :month, :reported_by])
    |> validate_required([:lsoa_code, :lsoa_name, :context, :crime_id, :crime_type, :falls_within, :last_outcome_category, :latitude, :location, :longitude, :month, :reported_by])
  end
end
