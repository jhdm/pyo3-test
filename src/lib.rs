use pyo3::prelude::*;

#[pyfunction]
fn hello(name: String) -> String {
    format!("Hello, {}!", name)
}

#[pymodule]
fn pyo3_test(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(hello, m)?)?;
    Ok(())
}
