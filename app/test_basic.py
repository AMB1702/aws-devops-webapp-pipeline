from app import app


def test_homepage_loads():
    """
    Basic sanity test to ensure the Flask application loads
    and returns a successful HTTP 200 response.
    """
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200
