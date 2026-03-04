<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* ===== FOOTER ===== */
.fc-footer {
    margin-top: auto;
    background: #ffffff;
    border-top: 1px solid #e0e0e0;
}

/* Footer layout */
.fc-footer-inner {
    max-width: 1300px;
    margin: 0 auto;
    padding: 28px 16px 20px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 24px;
}

.fc-footer-col {
    font-size: 13px;
    color: #555;
}

.fc-footer-title {
    font-size: 14px;
    font-weight: 700;
    color: #282c3f;
    margin-bottom: 10px;
}

.fc-footer-text {
    font-size: 13px;
    color: #757575;
    line-height: 1.6;
    max-width: 250px;
}

/* ===== HORIZONTAL QUICK LINKS ===== */
.fc-footer-links {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;          /* ⭐ horizontal */
    gap: 16px;              /* spacing */
    flex-wrap: wrap;        /* wrap on small screen */
}

.fc-footer-links li {
    margin: 0;
}

.fc-footer-links a {
    font-size: 13px;
    color: #555;
    text-decoration: none;
    font-weight: 500;
}

.fc-footer-links a:hover {
    color: #ff3f6c;
    text-decoration: underline;
}

/* ===== BOTTOM ===== */
.fc-footer-bottom {
    border-top: 1px solid #e0e0e0;
    padding: 10px 16px;
    background: #fafafa;
}

.fc-footer-bottom-inner {
    max-width: 1300px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    font-size: 12px;
    color: #757575;
}

@media (max-width: 600px) {
    .fc-footer-bottom-inner {
        flex-direction: column;
        text-align: center;
        gap: 6px;
    }
}
</style>

<footer class="fc-footer">
    <div class="fc-footer-inner">

        <div class="fc-footer-col">
            <h4 class="fc-footer-title">FutureCart</h4>
            <p class="fc-footer-text">
                India’s trusted electronics shopping destination.  
                Buy mobiles, laptops, TVs, speakers & appliances at best prices.
            </p>
        </div>

        <div class="fc-footer-col">
            <h4 class="fc-footer-title">Quick Links</h4>
            <ul class="fc-footer-links">
                <li><a href="categoryProducts?categoryId=1">Mobiles</a></li>
                <li><a href="categoryProducts?categoryId=3">Laptops</a></li>
                <li><a href="categoryProducts?categoryId=5">TVs</a></li>
                <li><a href="categoryProducts?categoryId=6">Speakers</a></li>
                <li><a href="categoryProducts?categoryId=4">Home Appliances</a></li>
            </ul>
        </div>

    </div>

    <div class="fc-footer-bottom">
        <div class="fc-footer-bottom-inner">
            <span>© 2025 FutureCart. All rights reserved.</span>
            <span>Made with ❤️ for Smart Shopping</span>
        </div>
    </div>
</footer>