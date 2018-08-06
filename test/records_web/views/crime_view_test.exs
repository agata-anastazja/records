defmodule RecordsWeb.CrimeViewTest do
  use RecordsWeb.ConnCase, async: true

  defmodule FakeCrime do
    defstruct id: 1, context: "some context", crime_id: "some crime_id", crime_type: "some crime_type", falls_within: "some falls_within", last_outcome_category: "some last_outcome_category", latitude: "120.5", location: "some location", longitude: "120.5", lsoa_code: "some lsoa_code", lsoa_name: "some lsoa_name", month: "some month", reported_by: "some reported_by"
  end



  test "GET /", %{conn: conn} do
    # fake crime, check it's there
    crime = %FakeCrime{}
    conn = get conn, "/crimes"
    contents = Phoenix.View.render_to_string(RecordsWeb.CrimeView, "index.html", crimes: [crime], conn: conn)
    assert String.contains?( contents,  "eating my cookie")
  end
end
