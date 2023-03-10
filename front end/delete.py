import pandas as pd
import streamlit as st
from database import view_all_data, view_only_employee_names, delete_data


def delete():
    result = view_all_data()
    df = pd.DataFrame(result, columns=["Employee_ID", "First_Name", "Last_Name", "Hire_Date", "City", "State"])
    with st.expander("Current data"):
        st.dataframe(df)
    list_of_employees = [i[0] for i in view_only_employee_names()]
    selected_employees = st.selectbox("Task to Delete", list_of_employees)
    st.warning("Do you want to delete ::{}".format(selected_employees))
    if st.button("Delete employee adat"):
        delete_data(selected_employees)
        st.success("employee details has been deleted successfully")
    new_result = view_all_data()
    df2 = pd.DataFrame(new_result, columns=["Employee_ID", "First_Name", "Last_Name", "Hire_Date", "City", "State"])
    with st.expander("Updated data"):
        st.dataframe(df2)