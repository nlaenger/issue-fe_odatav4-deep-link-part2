import { Service } from "@sap/cds/apis/services";

export default (srv: Service) => {
  srv.on("CREATE", "A", (req, next) => {});

  srv.on("READ", "B", async (req, next) => {});
};
