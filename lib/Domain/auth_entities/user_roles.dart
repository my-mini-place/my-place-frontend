enum Roles {
  administrator,
  manager,
  resident,
  repairman,
}

Roles stringToRole(String roleString) {
  switch (roleString) {
    case "Administrator":
      return Roles.administrator;

    case "Resident":
      return Roles.resident;

    case "Manager":
      return Roles.manager;

    case "Repairman":
      return Roles.repairman;

    default:
      return Roles.administrator;
  }
}

String roleToString(Roles role) {
  switch (role) {
    case Roles.administrator:
      return "Administrator";

    case Roles.resident:
      return "Resident";

    case Roles.manager:
      return "Manager";

    case Roles.repairman:
      return "Repairman";

    default:
      return "Administrator";
  }
}
