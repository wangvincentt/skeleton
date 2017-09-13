package dao;
import org.jooq.Configuration;
import org.jooq.DSLContext;
import org.jooq.impl.DSL;
import static com.google.common.base.Preconditions.checkState;
import static generated.Tables.RECEIPTS;

public class NetIdDao {
    DSLContext dsl;

    public NetIdDao(Configuration jooqConfig) {
        this.dsl = DSL.using(jooqConfig);
    }
}
