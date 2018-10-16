package entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HistoryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public HistoryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andOperationIdIsNull() {
            addCriterion("operation_id is null");
            return (Criteria) this;
        }

        public Criteria andOperationIdIsNotNull() {
            addCriterion("operation_id is not null");
            return (Criteria) this;
        }

        public Criteria andOperationIdEqualTo(Integer value) {
            addCriterion("operation_id =", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdNotEqualTo(Integer value) {
            addCriterion("operation_id <>", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdGreaterThan(Integer value) {
            addCriterion("operation_id >", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("operation_id >=", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdLessThan(Integer value) {
            addCriterion("operation_id <", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdLessThanOrEqualTo(Integer value) {
            addCriterion("operation_id <=", value, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdIn(List<Integer> values) {
            addCriterion("operation_id in", values, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdNotIn(List<Integer> values) {
            addCriterion("operation_id not in", values, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdBetween(Integer value1, Integer value2) {
            addCriterion("operation_id between", value1, value2, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationIdNotBetween(Integer value1, Integer value2) {
            addCriterion("operation_id not between", value1, value2, "operationId");
            return (Criteria) this;
        }

        public Criteria andOperationUserIsNull() {
            addCriterion("operation_user is null");
            return (Criteria) this;
        }

        public Criteria andOperationUserIsNotNull() {
            addCriterion("operation_user is not null");
            return (Criteria) this;
        }

        public Criteria andOperationUserEqualTo(String value) {
            addCriterion("operation_user =", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserNotEqualTo(String value) {
            addCriterion("operation_user <>", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserGreaterThan(String value) {
            addCriterion("operation_user >", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserGreaterThanOrEqualTo(String value) {
            addCriterion("operation_user >=", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserLessThan(String value) {
            addCriterion("operation_user <", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserLessThanOrEqualTo(String value) {
            addCriterion("operation_user <=", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserLike(String value) {
            addCriterion("operation_user like", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserNotLike(String value) {
            addCriterion("operation_user not like", value, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserIn(List<String> values) {
            addCriterion("operation_user in", values, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserNotIn(List<String> values) {
            addCriterion("operation_user not in", values, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserBetween(String value1, String value2) {
            addCriterion("operation_user between", value1, value2, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationUserNotBetween(String value1, String value2) {
            addCriterion("operation_user not between", value1, value2, "operationUser");
            return (Criteria) this;
        }

        public Criteria andOperationTimeIsNull() {
            addCriterion("operation_time is null");
            return (Criteria) this;
        }

        public Criteria andOperationTimeIsNotNull() {
            addCriterion("operation_time is not null");
            return (Criteria) this;
        }

        public Criteria andOperationTimeEqualTo(Date value) {
            addCriterion("operation_time =", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeNotEqualTo(Date value) {
            addCriterion("operation_time <>", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeGreaterThan(Date value) {
            addCriterion("operation_time >", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("operation_time >=", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeLessThan(Date value) {
            addCriterion("operation_time <", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeLessThanOrEqualTo(Date value) {
            addCriterion("operation_time <=", value, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeIn(List<Date> values) {
            addCriterion("operation_time in", values, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeNotIn(List<Date> values) {
            addCriterion("operation_time not in", values, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeBetween(Date value1, Date value2) {
            addCriterion("operation_time between", value1, value2, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationTimeNotBetween(Date value1, Date value2) {
            addCriterion("operation_time not between", value1, value2, "operationTime");
            return (Criteria) this;
        }

        public Criteria andOperationResultIsNull() {
            addCriterion("operation_result is null");
            return (Criteria) this;
        }

        public Criteria andOperationResultIsNotNull() {
            addCriterion("operation_result is not null");
            return (Criteria) this;
        }

        public Criteria andOperationResultEqualTo(String value) {
            addCriterion("operation_result =", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultNotEqualTo(String value) {
            addCriterion("operation_result <>", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultGreaterThan(String value) {
            addCriterion("operation_result >", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultGreaterThanOrEqualTo(String value) {
            addCriterion("operation_result >=", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultLessThan(String value) {
            addCriterion("operation_result <", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultLessThanOrEqualTo(String value) {
            addCriterion("operation_result <=", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultLike(String value) {
            addCriterion("operation_result like", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultNotLike(String value) {
            addCriterion("operation_result not like", value, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultIn(List<String> values) {
            addCriterion("operation_result in", values, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultNotIn(List<String> values) {
            addCriterion("operation_result not in", values, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultBetween(String value1, String value2) {
            addCriterion("operation_result between", value1, value2, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationResultNotBetween(String value1, String value2) {
            addCriterion("operation_result not between", value1, value2, "operationResult");
            return (Criteria) this;
        }

        public Criteria andOperationReasonIsNull() {
            addCriterion("operation_reason is null");
            return (Criteria) this;
        }

        public Criteria andOperationReasonIsNotNull() {
            addCriterion("operation_reason is not null");
            return (Criteria) this;
        }

        public Criteria andOperationReasonEqualTo(String value) {
            addCriterion("operation_reason =", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonNotEqualTo(String value) {
            addCriterion("operation_reason <>", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonGreaterThan(String value) {
            addCriterion("operation_reason >", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonGreaterThanOrEqualTo(String value) {
            addCriterion("operation_reason >=", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonLessThan(String value) {
            addCriterion("operation_reason <", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonLessThanOrEqualTo(String value) {
            addCriterion("operation_reason <=", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonLike(String value) {
            addCriterion("operation_reason like", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonNotLike(String value) {
            addCriterion("operation_reason not like", value, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonIn(List<String> values) {
            addCriterion("operation_reason in", values, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonNotIn(List<String> values) {
            addCriterion("operation_reason not in", values, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonBetween(String value1, String value2) {
            addCriterion("operation_reason between", value1, value2, "operationReason");
            return (Criteria) this;
        }

        public Criteria andOperationReasonNotBetween(String value1, String value2) {
            addCriterion("operation_reason not between", value1, value2, "operationReason");
            return (Criteria) this;
        }

        public Criteria andRecordIdIsNull() {
            addCriterion("record_id is null");
            return (Criteria) this;
        }

        public Criteria andRecordIdIsNotNull() {
            addCriterion("record_id is not null");
            return (Criteria) this;
        }

        public Criteria andRecordIdEqualTo(Integer value) {
            addCriterion("record_id =", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotEqualTo(Integer value) {
            addCriterion("record_id <>", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThan(Integer value) {
            addCriterion("record_id >", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("record_id >=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThan(Integer value) {
            addCriterion("record_id <", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThanOrEqualTo(Integer value) {
            addCriterion("record_id <=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdIn(List<Integer> values) {
            addCriterion("record_id in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotIn(List<Integer> values) {
            addCriterion("record_id not in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdBetween(Integer value1, Integer value2) {
            addCriterion("record_id between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotBetween(Integer value1, Integer value2) {
            addCriterion("record_id not between", value1, value2, "recordId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}