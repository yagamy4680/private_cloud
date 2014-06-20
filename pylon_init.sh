#!/bin/bash

# Make sure "smith" user exists.
#
USER="smith"
USER_HOME="/home/${USER}"
USER_SSH="${USER_HOME}/.ssh"
USER_FOUND=$(cut -d: -f1 /etc/passwd | grep "^${USER}")
if [ "" == "${USER_FOUND}" ]; then
	echo "creating user ${USER}"
	useradd --base-dir ${USER_HOME} --home-dir ${USER_HOME} --create-home --shell /bin/bash ${USER}
fi

# Add necessary public keys for "smith"
#
USER_SSH="${USER_HOME}/.ssh"
if [ ! -f "${USER_SSH}/authorized_keys" ]; then
	echo "adding ${USER_SSH}"
	mkdir -p ${USER_SSH}
	chown ${USER}:${USER} ${USER_SSH}
	chmod 0700 ${USER_SSH}
	cat <<KEY > ${USER_SSH}/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOr36RQ57COLDBgdZZcBVU7rV83Kf1xll0CJXSFl6CFejP7J3hqeyiVA7X3Zwr6l03M3eQEoNfTYy7vyY9/i40rryunhlrDE00freA5+LH/8wlmkh+TYQ/3U5+k8OENoL1C0pQBxCZco6lH9cUfw1EOaTj6rlzWGofyWg1zwF8AciCGiM/lxL8pZlOmqTRFNAa0Y0fSzYUZD+gJyr05McGUhFIlIO3htD/aKeuU/0YcxQ8ktF8Kn3gxSIIxEqWY+Of9s7jmIZ7McPcYZcUGbzzGCUqR9oPH9aaBJHRReNoe95WXdEvPyaRuw8ik3EbNMw3n5lJI0ME4M2/54CMd3g/ yagamy@edifier.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD5a7TIemRoqGkB0No+mOpbHz/tmIDw2RmOUfdcweF8KKxmUZtcYOHPGIcaDBnd8sH7CkNpTnVKDl29K7Xc/ApTVVCSKUUep2pOZYm+xuy2ubzMahD496TDbTwYmAt8rMau6WsnXIvpntxFziOxls7Er1sN9qo61MT1CBBw+je9Gpx5BNIwyGPs2Vx+bdgNXqqnVWBzzSvtz8L7eNeyNS0VOIJGJD+u5W4PacKV/FJhtmDvVsYYEVMYZLkdApPy/MrzmtyfSqMRsOvzOxvaaN1v9cMmRFzt/QDG4Nd8pyQ3XzXOx5pGKmAxpCsbxpmq95n2jB6rSYwoFIdoUt3BMR1 yagamy@grandia.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVecLyY18zh47yo6qvAe7lVnu2+KilyZ+4a5L6ICs9MseJ7jRyfojdor1Vb3db7GgKISqL3cqaNBzJf5gGsXFE6wvXL327nVwgq+NI0YcjtbSAnDFgJvP/GrY3ESvifOmTQ/HE61jkbzZLa5vpMEW8iK7wvkFH9Ls+ZbrKAL7QhtPyUwTr1aYCO/+o1aGrR86vqVCSXlxnQgahwVTv+Upr/kN8fQXK4kDr6cc5kRom1L2RoMT1QIXevX65eqP6vdhKlrVCc0+csVMKFolFDTwwee/ibxq+k9EP+TEPYZFZVGn1G2INqxUmvMIfCWa/MPPPh+R8Or7Oj6ltuNak0sll root@matrix
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOvvFwFh3dRLGEqI7MMLoYNFTLX+G0N92SlWZZJS7bqCR0wl40NaOFjdgRV5C4SzXa47JjUNyNMcss0yCnQtVlMgrnFz84j+Q2TWYME6sAQKxe8/6VZD92TN8ZjCTO7M61gI1hvN8/prr8pG7uqn7o+IUjwH2iDcurU/tPXGVECslXXukO2/Zuk2WVM7yCLUv0LdAI8iqyKDt6rKK6igAKkoW9/Dpm961d19q4ccciJCqsJYQY1dAYjnjYKU48Y8zfyTC82ApyCWOGT/d9fXVh1sIFEbF7uQ3OotSIfSk7lQRSz5E6y39MR2dxUmkyBdLWFprX9TrGopjQOiaAY9Eb clementyu@laptop
ssh-dss AAAAB3NzaC1kc3MAAACBAOyAMa6Lg0XZ7CAf4UsJ72zx5yWMIpzjSbkWEFdch6K3ZzXyAEZhuy5v677UIScKHUDBCf2jQWbA5zEsxyeV+YxRcO9cIgET5NkzV/36yNGaAY8XGRwXtlWi3l7DlKIN3APgrWmlkFvw2vpCTTR/fP/XwfxrIvik9FDKzIs5EqVbAAAAFQDlZSLfkLZVIlPOWo80KHs8h37spQAAAIATD3mnXmgkZH3dKWtr2ljl2RQl2As2T4QBCzdgWQofYQuHjkwbNa04vatUgVnuQvAnhIlPSQ1uN+pCCuo6cZCEfyHQpKcMJtJZzEajUTxTf6jifGNBy0iYp77q9GkDdR8YNgdK2zYll5zUqfyBsEjbbpqu8UKGIbEBh6kh7rYO8gAAAIEAwu9QVT/hagxODLB52z24dKBFHHXbmss2Hd/vdPIIqR8GtOd3LJBJ+lh1EB1Gj1DxFRLBeoY3YxQeyqtExv5EDRzAafLSssNuPgvIyBD2gz6gr6H8NAXzukUMEurYIstpeCjD34k+/Q3qwNnvLfJWOY2WLcQKec3UL0eDPWbrxoA= arronretina@JETSTREAM.local
KEY
	chmod 0600 ${USER_SSH}/authorized_keys
	chown ${USER}:${USER} ${USER_SSH}/authorized_keys
fi

# Ensure "smith" become the sudoers
#
SUDO=$(cat /etc/sudoers | grep -v "#" | grep "^${USER}")
if [ "" == "${SUDO}" ]; then
	echo "adding smith to /etc/sudoers"
	echo "smith ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# Update APT repositories.
#
echo "update apt repositories and necessary utilities"
apt-get update -qq
apt-get install -y -q curl vim openssh-server avahi-daemon git

# Install OpenSSH server
#
echo "installing openssh server"
sed -i 's/^#GSSAPIAuthentication no/GSSAPIAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/^#GSSAPICleanupCredentials yes/GSSAPICleanupCredentials yes/g' /etc/ssh/sshd_config
service ssh restart

# Install avahi-daemon for bonjour protocol
#
echo "installing avahi-daemon for bonjour protocol"
service avahi-daemon restart

# Download entire "private_cloud" repository and then execute further installation scripts.
# 
if [ "false" == "${IGNORE_CHAIN_EXECUTION}" ]; then
	CURRENT=$(pwd)
	cd /opt
	git clone https://github.com/yagamy4680/private_cloud.git
	cd /opt/private_cloud/scripts
	./install_all.sh
	cd ${CURRENT}
fi
