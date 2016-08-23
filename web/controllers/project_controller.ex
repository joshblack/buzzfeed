defmodule Buzzfeed.ProjectController do
  use Buzzfeed.Web, :controller

  alias Buzzfeed.Project

  def action(conn, _) do
    user = Repo.get_by!(Buzzfeed.User, %{id: 2})

    apply(__MODULE__, action_name(conn), [conn, conn.params, user])
  end

  def index(conn, _params, user) do
    projects =
      user
      |> Ecto.assoc(:projects)
      |> Repo.all()

    render(conn, "index.html", projects: projects)
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:projects)
      |> Project.changeset()

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"project" => project_params}, user) do
    changeset =
      user
      |> build_assoc(:projects)
      |> Project.changeset(project_params)

    case Repo.insert(changeset) do
      {:ok, _project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: project_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    project = Repo.get!(assoc(user, :projects), id)

    render(conn, "show.html", project: project)
  end

  def edit(conn, %{"id" => id}, user) do
    project = Repo.get!(assoc(user, :projects), id)
    changeset = Project.changeset(project)
    render(conn, "edit.html", project: project, changeset: changeset)
  end

  def update(conn, %{"id" => id, "project" => project_params}, user) do
    project = Repo.get!(assoc(user, :projects), id)
    changeset = Project.changeset(project, project_params)

    case Repo.update(changeset) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: project_path(conn, :show, project))
      {:error, changeset} ->
        render(conn, "edit.html", project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    project = Repo.get!(assoc(user, :projects), id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: project_path(conn, :index))
  end
end

