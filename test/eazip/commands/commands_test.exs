defmodule Eazip.CommandsTest do
  use Eazip.DataCase

  alias Eazip.Commands

  describe "commands" do
    alias Eazip.Commands.Command

    @valid_attrs %{status: "some status"}
    @update_attrs %{status: "some updated status"}
    @invalid_attrs %{status: nil}

    def command_fixture(attrs \\ %{}) do
      {:ok, command} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Commands.create_command()

      command
    end

    test "list_commands/0 returns all commands" do
      command = command_fixture()
      assert Commands.list_commands() == [command]
    end

    test "get_command!/1 returns the command with given id" do
      command = command_fixture()
      assert Commands.get_command!(command.id) == command
    end

    test "create_command/1 with valid data creates a command" do
      assert {:ok, %Command{} = command} = Commands.create_command(@valid_attrs)
      assert command.status == "some status"
    end

    test "create_command/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Commands.create_command(@invalid_attrs)
    end

    test "update_command/2 with valid data updates the command" do
      command = command_fixture()
      assert {:ok, %Command{} = command} = Commands.update_command(command, @update_attrs)
      assert command.status == "some updated status"
    end

    test "update_command/2 with invalid data returns error changeset" do
      command = command_fixture()
      assert {:error, %Ecto.Changeset{}} = Commands.update_command(command, @invalid_attrs)
      assert command == Commands.get_command!(command.id)
    end

    test "delete_command/1 deletes the command" do
      command = command_fixture()
      assert {:ok, %Command{}} = Commands.delete_command(command)
      assert_raise Ecto.NoResultsError, fn -> Commands.get_command!(command.id) end
    end

    test "change_command/1 returns a command changeset" do
      command = command_fixture()
      assert %Ecto.Changeset{} = Commands.change_command(command)
    end
  end

  describe "command_services" do
    alias Eazip.Commands.CommandService

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def command_service_fixture(attrs \\ %{}) do
      {:ok, command_service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Commands.create_command_service()

      command_service
    end

    test "list_command_services/0 returns all command_services" do
      command_service = command_service_fixture()
      assert Commands.list_command_services() == [command_service]
    end

    test "get_command_service!/1 returns the command_service with given id" do
      command_service = command_service_fixture()
      assert Commands.get_command_service!(command_service.id) == command_service
    end

    test "create_command_service/1 with valid data creates a command_service" do
      assert {:ok, %CommandService{} = command_service} =
               Commands.create_command_service(@valid_attrs)
    end

    test "create_command_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Commands.create_command_service(@invalid_attrs)
    end

    test "update_command_service/2 with valid data updates the command_service" do
      command_service = command_service_fixture()

      assert {:ok, %CommandService{} = command_service} =
               Commands.update_command_service(command_service, @update_attrs)
    end

    test "update_command_service/2 with invalid data returns error changeset" do
      command_service = command_service_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Commands.update_command_service(command_service, @invalid_attrs)

      assert command_service == Commands.get_command_service!(command_service.id)
    end

    test "delete_command_service/1 deletes the command_service" do
      command_service = command_service_fixture()
      assert {:ok, %CommandService{}} = Commands.delete_command_service(command_service)

      assert_raise Ecto.NoResultsError, fn ->
        Commands.get_command_service!(command_service.id)
      end
    end

    test "change_command_service/1 returns a command_service changeset" do
      command_service = command_service_fixture()
      assert %Ecto.Changeset{} = Commands.change_command_service(command_service)
    end
  end
end
