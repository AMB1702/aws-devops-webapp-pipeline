from app import app


def test_homepage_loads():
    """
    Basic sanity test to ensure the Flask application loads
    and returns a successful HTTP 200 response.
    """
    client = app.test_client()
    response = client.get("/")
    assert response.status_code == 200


def test_version_text_present():
    """
    Ensures the updated application text is rendered on the homepage.
    This validates that the CI/CD pipeline has deployed the latest version.
    """
    client = app.test_client()
    response = client.get("/")
    assert b"v2 of the application" in response.data
