import pandas as pd
import streamlit as st
from database import view_all_data

def read():
    result = view_all_data()
    df = pd.DataFrame(result, columns=["Employee_ID", "First_Name", "Last_Name", "Hire_Date", "City", "State"])
    with st.expander("View all employees"):
        st.dataframe(df)
    