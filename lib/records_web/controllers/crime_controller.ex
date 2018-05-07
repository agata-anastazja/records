defmodule RecordsWeb.CrimeController do
  use RecordsWeb, :controller

  alias Records.Records
  alias Records.Crime

  def index(conn, _params) do
    crimes = Records.list_crimes()
    render(conn, "index.html", crimes: crimes)
  end

  def new(conn, _params) do
    changeset = Records.change_crime(%Crime{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"crime" => crime_params}) do
    case Records.create_crime(crime_params) do
      {:ok, crime} ->
        conn
        |> put_flash(:info, "Crime created successfully.")
        |> redirect(to: crime_path(conn, :show, crime))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    crime = Records.get_crime!(id)
    render(conn, "show.html", crime: crime)
  end

  def edit(conn, %{"id" => id}) do
    crime = Records.get_crime!(id)
    changeset = Records.change_crime(crime)
    render(conn, "edit.html", crime: crime, changeset: changeset)
  end

  def update(conn, %{"id" => id, "crime" => crime_params}) do
    crime = Records.get_crime!(id)

    case Records.update_crime(crime, crime_params) do
      {:ok, crime} ->
        conn
        |> put_flash(:info, "Crime updated successfully.")
        |> redirect(to: crime_path(conn, :show, crime))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", crime: crime, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    crime = Records.get_crime!(id)
    {:ok, _crime} = Records.delete_crime(crime)

    conn
    |> put_flash(:info, "Crime deleted successfully.")
    |> redirect(to: crime_path(conn, :index))
  end
end
