defmodule RecordsWeb.CrimeControllerTest do
  use RecordsWeb.ConnCase

  alias Records.Records

  @create_attrs %{context: "some context", crime_id: "some crime_id", crime_type: "some crime_type", falls_within: "some falls_within", last_outcome_category: "some last_outcome_category", latitude: "120.5", location: "some location", longitude: "120.5", lsoa_code: "some lsoa_code", lsoa_name: "some lsoa_name", month: "some month", reported_by: "some reported_by"}

  def fixture(:crime) do
    {:ok, crime} = Records.create_crime(@create_attrs)
    crime
  end

  describe "index" do
    test "lists all crimes", %{conn: conn} do
      conn = get conn, crime_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Crimes"
    end
  end

  describe "delete crime" do
    setup [:create_crime]

    test "deletes chosen crime", %{conn: conn, crime: crime} do
      conn = delete conn, crime_path(conn, :delete, crime)
      assert redirected_to(conn) == crime_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, crime_path(conn, :show, crime)
      end
    end
  end

  defp create_crime(_) do
    crime = fixture(:crime)
    {:ok, crime: crime}
  end
end
