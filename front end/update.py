import pandas as pd
import streamlit as st
from database import view_all_data, view_only_employee_names, get_employee, edit_employee_data


def update():
    result = view_all_data()
    df = pd.DataFrame(result, columns=["Employee_ID", "First_Name", "Last_Name", "Hire_Date", "City", "State"])
    with st.expander("Current emplpyees:"):
        st.dataframe(df)
    list_of_dealers = [i[0] for i in view_only_employee_names()]
    selected_employees = st.selectbox("Employee Details to Edit", list_of_dealers)
    selected_result = get_employee(selected_employees)
    if selected_result:
        Employee_ID = selected_result[0][0]
        First_Name = selected_result[0][1]
        Last_Name = selected_result[0][2]
        Hire_Date = selected_result[0][3]
        City = selected_result[0][4]
        State = selected_result[0][5]
        col1, col2 = st.columns(2)
        with col1:
            new_Employee_ID = st.text_input("Emp ID:", Employee_ID)
            new_First_Name = st.text_input("First Name:", First_Name)
            new_Last_Name = st.text_input("Last Type:", Last_Name)
        with col2:
            new_Hire_Date = st.text_input("Date of Hire", Hire_Date)
            new_City = st.selectbox(City, ["Bengaluru", "Chennai", "Mumbai", "Hyderabad", "Jaipur", "Kolkata", "Pune"])
            new_State = st.selectbox(State, ["Karnataka", "Tamil Nadu", "Maharashtra", "Telangana", "West Bengal", "Rajasthan"])
        if st.button("Update Dealer"):
            edit_employee_data(new_Employee_ID, new_First_Name, new_Last_Name, new_Hire_Date, new_City, new_State)
        st.success("Successfully updated:: {} to ::{}".format(Employee_ID, new_Employee_ID))
        result2 = view_all_data()
        df2 = pd.DataFrame(result2, columns=["Employee_ID", "First_Name", "Last_Name", "Hire_Date", "City", "State"])
        with st.expander("Updated data"):
            st.dataframe(df2)
