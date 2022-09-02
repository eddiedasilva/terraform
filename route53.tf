resource "aws_route53_zone" "kc-cloud" {
#resource "aws_route53_zone" "${var.DOMAIN_NAME}" {
#resource "aws_route53_zone" "kccloud.com" {
	name = "kc-cloud.com"
}

resource "aws_route53_record" "VM3" {
	zone_id = "${aws_route53_zone.kc-cloud.zone_id}"
	#zone_id = aws_route53_zone.kc-cloud.zone_id
	name = "VM3.kc-cloud"
	type = "A"
	ttl = "300"
	records = ["18.170.50.55"]
}
resource "aws_route53_record" "www_record" {
	zone_id = "${aws_route53_zone.kc-cloud.zone_id}"
	#zone_id = aws_route53_zone.kc-cloud.zone_id
	name = "www.kc-cloud"
	type = "A"
	ttl = "300"
	records = ["18.170.50.55"]
}
#resource "aws_route53_record" "mail_record" {
#	#zone_id = "${aws_route53_zone.kc-cloud.com.zone_id}"
#	zone_id = aws_route53_zone.kc-cloud.com.zone_id
#	name = "kc-cloud.com"
#	type = "MX"
#	ttl = "300"
#	records = [
#	  "1 aspmx.l.google.com.",
#	  "5 altl.aspmx.google.com.",
#	  "5 alt2.aspmx.google.com.",
#	  "10 aspmx2.google.com.",
#	  "10 aspmx3.google.com."
#	]
#}
output "ns-server" {
	value = "${aws_route53_zone.kc-cloud.name_servers}"
}
