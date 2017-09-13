package dao;

import api.ReceiptResponse;
import generated.tables.records.TagsRecord;
import generated.tables.records.ReceiptsRecord;
import org.jooq.Configuration;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;

import java.math.BigDecimal;
import java.util.List;

import static com.google.common.base.Preconditions.checkState;
import static generated.Tables.TAGS;
import static generated.Tables.RECEIPTS;

public class TagDao {
    DSLContext dsl;

    public TagDao(Configuration jooqConfig) {
        this.dsl = DSL.using(jooqConfig);
    }

    public void insert(int receipt_id, String tag_name) {
        dsl
        .insertInto(TAGS, TAGS.RECEIPT_ID, TAGS.TAG_NAME)
        .values(receipt_id, tag_name)
        .execute();
    }

    public void toggleTag(int receipt_id, String tag_name){
        boolean exists = dsl.fetchExists(
          dsl
          .select()
          .from(TAGS)
          .where(TAGS.RECEIPT_ID.eq(receipt_id).and(TAGS.TAG_NAME.eq(tag_name)))
        );
        if (exists)
            delete_tag(receipt_id, tag_name);
        else
            insert(receipt_id, tag_name);
    }

    public void delete_tag(Integer receipt_id, String tag_name){
        dsl.delete(TAGS)
           .where(TAGS.RECEIPT_ID.eq(receipt_id).and(TAGS.TAG_NAME.eq(tag_name)))
           .execute();
    }

    public List<ReceiptsRecord> getTags(String tag_name){
        return dsl.select()
           .from(RECEIPTS)
           .leftOuterJoin(TAGS)
           .on(RECEIPTS.ID.eq(TAGS.RECEIPT_ID))
           .where (TAGS.TAG_NAME.eq(tag_name))
           .fetchInto(ReceiptsRecord.class);
    }

    public List<TagsRecord> getAllTags(){
        return  dsl.selectFrom(TAGS).fetch();
    }
}
