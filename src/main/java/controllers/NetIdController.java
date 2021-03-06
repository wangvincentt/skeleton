package controllers;

import api.CreateReceiptRequest;
import api.ReceiptResponse;
import dao.NetIdDao;
import generated.tables.records.ReceiptsRecord;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Path("/netid")
public class NetIdController {

    final NetIdDao netid;

    public NetIdController(NetIdDao netid) {
        this.netid = netid;
    }

    @GET
    public String getNetID() {
        return "jw2476";
    }
}
