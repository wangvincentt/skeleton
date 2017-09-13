package controllers;

import api.CreateReceiptRequest;
import api.CreateTagRequest;
import api.ReceiptResponse;
import api.TagResponse;
import dao.ReceiptDao;
import dao.TagDao;
import generated.tables.records.ReceiptsRecord;
import generated.tables.records.TagsRecord;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Path("/tags")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class TagController {
    final TagDao tags;

    public TagController(TagDao tags) {
        this.tags = tags;
    }

    @POST
    @Path("/{tag}")
    public void createTag(@PathParam("tag") String tag_name, CreateTagRequest tag) {
        tags.insert(tag.receipt_id, tag_name);
    }

    @PUT
    @Path("/{tag}")
    public void toggleTag(@PathParam("tag") String tag_name, CreateTagRequest tag) {
        tags.toggleTag(tag.receipt_id, tag_name);
    }

    @GET
    @Path("/{tag}")
    public List<ReceiptResponse> getTags(@PathParam("tag") String tag_name) {
        List<ReceiptsRecord> tagRecords = tags.getTags(tag_name);
        return tagRecords.stream().map(ReceiptResponse::new).collect(toList());
    }

    @GET
    public List<TagResponse> getAllTags() {
        List<TagsRecord> tagRecords = tags.getAllTags();
        return tagRecords.stream().map(TagResponse::new).collect(toList());
    }
}
